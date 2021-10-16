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

        public async Task<IEnumerable<Stock>> GetStock(string deposito,string ubicacion)
        {
            var stock = _UnitOfWork.StockRepository.Get(x => x.Deposito == deposito);
            if (stock != null)
                throw new BusinessException(String.Format("No se encuentran productos en la ubicación {0}-{1}",deposito,ubicacion));
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
            if (!ValidarUbicacion(ubicacion))
                throw new BusinessException(String.Format("La ubicación:{0} no cumple con el formato requerido {{Area}}-{{Pasillo}}-{{Fila}}-{{Cara}}", ubicacion));

            if (!EstaEnDeposito(producto))
                throw new BusinessException(String.Format("La ubicación:{0} no cumple con el formato requerido {{Area}}-{{Pasillo}}-{{Fila}}-{{Cara}}", ubicacion));

            Ubicacion ubi = new Ubicacion(ubicacion);
            Stock stock = new Stock();
            stock.Deposito = deposito;
            stock.Area = ubi.Area;
            stock.Pasillo = ubi.Pasillo;
            stock.Fila = ubi.Fila;
            stock.Cara = ubi.Cara;
            stock.ProductId = producto;
            stock.Cantidad = cantidad;
            
            await _UnitOfWork.StockRepository.Insert(stock);
            await _UnitOfWork.SaveChangesAsync();
            return stock;
        }

        private bool ValidarUbicacion(string ubicacion)
        {
            Regex ValidacionUbicacion = new Regex(@"\A[A-Z][A-Z]-[0-9][0-9]-[0-9][0-9]-(IZ|DE)\Z");
            if (ValidacionUbicacion.IsMatch(ubicacion))
                return true;
            return false;
        }

        private bool EstaEnDeposito(string producto)
        {
            return true;
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
