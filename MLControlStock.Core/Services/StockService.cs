using AutoMapper;
using MLControlStock.Core.ApiClient.Content;
using MLControlStock.Core.ApiClient.Dtos;
using MLControlStock.Core.DTOs;
using MLControlStock.Core.Entities;
using MLControlStock.Core.Exceptions;
using MLControlStock.Core.Interfaces;
using MLControlStock.Core.QueryFilters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Security.Claims;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace MLControlStock.Core.Services
{
    public class StockService: IStockService
    {
        private IUnitOfWork _UnitOfWork;
        private IApiClient _ApiClient;
        private readonly IMapper _Mapper;

        public StockService(IUnitOfWork unitOfWork, IMapper mapper, IApiClient ApiClient)
        {
            _UnitOfWork = unitOfWork;
            _ApiClient = ApiClient;
            _Mapper = mapper;    
        }

        public IEnumerable<Stock> GetStock(string deposito, string ubicacion)
        {
            ValidarUbicacion(ubicacion);
            Ubicacion ubi = new Ubicacion(ubicacion);
            var stock = GetStock(deposito, ubi);
            if (stock == null)
                throw new BusinessException(String.Format("No se encuentran productos en la ubicación {0}-{1}", deposito, ubicacion));
            return stock;
        }

        public IEnumerable<Stock> GetStock(string deposito,Ubicacion ubicacion)
        {
            var stock = _UnitOfWork.StockRepository.Get(x => x.Deposito == deposito && x.Area == ubicacion.Area && x.Pasillo == ubicacion.Pasillo 
                                                        && x.Fila == ubicacion.Fila && x.Cara == ubicacion.Cara);            
            return stock;
        }

        public async Task<IEnumerable<Stock>> GetStockPorProducto(string deposito, string producto)
        {
            var stock = _UnitOfWork.StockRepository.Get(x => x.Deposito == deposito && x.ProductId == producto);
            if (stock != null)
                throw new BusinessException(String.Format("No se encuentran el producto {0} en el depósito {1}", producto, deposito));
            return stock;
        }

        public async Task<Stock> GetStockPorProductoUbicacion(string deposito, string producto)
        {
            var stock = _UnitOfWork.StockRepository.Get(x => x.Deposito == deposito && x.ProductId == producto).FirstOrDefault();
            if (stock != null)
                throw new BusinessException(String.Format("No se encuentran el producto {0} en el depósito {1}", producto, deposito));
            return stock;
        }

        public async Task<Stock> AgregarProducto(string deposito, string ubicacion,string producto,int cantidad)
        {
            Stock stock;
            ValidarUbicacion(ubicacion);
            await EstaEnDeposito(producto);
            Ubicacion ubi = new Ubicacion(ubicacion);
            var stocks = GetStock(deposito, ubi);
            if (stocks != null)
            {
                ValidarLugarDisponibleEnUbicacion(stocks, ubicacion, cantidad);            
                stock = stocks.Where(x => x.ProductId == producto).FirstOrDefault();
                if (stock == null)
                {
                    stock = NuevoStock(deposito, ubi, producto, cantidad);
                    await _UnitOfWork.StockRepository.Insert(stock);
                }
                else
                {
                    stock.Cantidad += cantidad;
                     _UnitOfWork.StockRepository.Update(stock);
                }                    
            }
            else
            {
                stock = NuevoStock(deposito, ubi, producto, cantidad);
                await _UnitOfWork.StockRepository.Insert(stock);
            }            
           
            await _UnitOfWork.SaveChangesAsync();
            return stock;
        }

        private Stock NuevoStock(string deposito, Ubicacion ubicacion, string producto, int cantidad)
        {
            var stock = new Stock();
            stock.Deposito = deposito;
            stock.Area = ubicacion.Area;
            stock.Pasillo = ubicacion.Pasillo;
            stock.Fila = ubicacion.Fila;
            stock.Cara = ubicacion.Cara;
            stock.ProductId = producto;
            stock.Cantidad = cantidad;
            return stock;
        }

        private void ValidarUbicacion(string ubicacion)
        {
            Regex ValidacionUbicacion = new Regex(@"\A[A-Z][A-Z]-[0-9][0-9]-[0-9][0-9]-(IZ|DE)\Z");
            if (!ValidacionUbicacion.IsMatch(ubicacion))
               throw new BusinessException(String.Format("La ubicación:{0} no cumple con el formato requerido {{Area}}-{{Pasillo}}-{{Fila}}-{{Cara}}", ubicacion));
        }

        private void ValidarLugarDisponibleEnUbicacion(IEnumerable<Stock> stock,string ubicacion, int cantidad)
        {
            //Se podría cambiar por una función que llame a un Stored Procedure que traiga la cantidad de items en la ubicación directamente 
            //o que devuelva si hay lugar disponible
            if (stock != null)
            {
                if (stock.Count() > 2)
                    throw new BusinessException(String.Format("Existen más de tres productos en la ubicación: {0}", ubicacion));

                if (stock.Sum(x=>x.Cantidad) + cantidad > 100)
                    throw new BusinessException(String.Format("Existen más de cien productos en la ubicación: {0}", ubicacion));
            }
            //Se podría dividir este método para cumplir criterios de unicidad en función en dos, por ejemplo LugarDisponibleEnUbicacion y HayMenosDeCientProductos 
            //pero para hacer una sola llamada a la base se realizan bajo el mismo ámbito.                       
        }       


        private async Task EstaEnDeposito(string producto)
        {
            ItemResponse item = await _ApiClient.Items(producto);
            if (item != null)
                if (item.shipping.logistic_type != "fulfillment")
                    throw new BusinessException("El producto no se encuentra en nuestros depósitos (no es fulfillment).");            
        }

        public async Task<bool> RetirarProducto(string deposito, string ubicacion, string producto, int cantidad)
        {
            var stock = await GetStockPorProductoUbicacion(producto, ubicacion);
            if (stock == null)
                throw new BusinessException(String.Format("No se encuentra el Producto:{0} en la ubicación:{1}-{2}", producto,deposito,ubicacion));

            if (cantidad > stock.Cantidad)
                throw new BusinessException(String.Format("La cantidad ({0}) a retirar es mayor al stock disponible",cantidad));

            if (cantidad < stock.Cantidad)
            {
                stock.Cantidad -= cantidad;
                _UnitOfWork.StockRepository.Update(stock);
            }
            else
            {
                await _UnitOfWork.StockRepository.Delete(stock);
            }            
            await _UnitOfWork.SaveChangesAsync();
            return true;
        }
    }
}
