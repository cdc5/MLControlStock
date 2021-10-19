using Microsoft.EntityFrameworkCore;
using MLControlStock.Core.DTOs;
using MLControlStock.Core.Entities;
using MLControlStock.Core.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace MlControlStock.UnitTests
{
    public class StockRepositoryMock : IStockRepository
    {
        //Simula el repositorio del tipo T con una lista, a donde se agregan, retirar y modifican las entidades
        //como si fuera el acceso a la Base de Datos
        private readonly List<Stock> _stocks;
        
        //simula la completitud de una tarea asincronica, se hace una tarea en cache para optimizar la respuesta.
        public static readonly Task CompletedTask = Task.FromResult(false);
        public static readonly Task<Stock> CompletedTaskStock = Task.FromResult(new Stock());

        public StockRepositoryMock()
        {
            _stocks = new List<Stock>()
            {
                new Stock() { Deposito = "AR01",Area = "LM",Pasillo = "00",Fila = "00",Cara = "IZ",ProductId = "MLA813727183",Cantidad = 50 },
                new Stock() { Deposito = "AR01",Area = "LM",Pasillo = "00",Fila = "00",Cara = "IZ",ProductId = "MLA813727184",Cantidad = 8 },
                new Stock() { Deposito = "AR01",Area = "LM",Pasillo = "00",Fila = "00",Cara = "IZ",ProductId = "MLA813727185",Cantidad = 14 },
                new Stock() { Deposito = "AR01",Area = "LM",Pasillo = "04",Fila = "02",Cara = "IZ",ProductId = "MLA813727183",Cantidad = 28 },
                new Stock() { Deposito = "AR01",Area = "LM",Pasillo = "01",Fila = "01",Cara = "DE",ProductId = "MLA813727183",Cantidad = 11 },
                new Stock() { Deposito = "AR01",Area = "AL",Pasillo = "00",Fila = "00",Cara = "DE",ProductId = "MLA813727184",Cantidad = 21 },
                new Stock() { Deposito = "AR01",Area = "AL",Pasillo = "00",Fila = "00",Cara = "IZ",ProductId = "MLA813727185",Cantidad = 13 },
            };
        }       


        public Task AddRange(IEnumerable<Stock> entity)
        {
            _stocks.AddRange(entity);
            return CompletedTask;
        }

        public Task Delete(Stock entity)
        {
            _stocks.Remove(entity);
            return CompletedTask;
        }

        public Task Delete(int id)
        {
            return CompletedTask;
        }

        public Task Delete(string id)
        {
            return CompletedTask;
        }

        public void Desacoplar(Stock entity)
        {
            return;
        }

        public IEnumerable<Stock> Get(Expression<Func<Stock, bool>> filter = null, Func<IQueryable<Stock>, IOrderedQueryable<Stock>> orderBy = null, string includeProperties = "", int? take = null)
        {
            IQueryable<Stock> query = _stocks.AsQueryable();
            if (filter != null)
            {
                query = query.Where(filter);
            }

            foreach (var includeProperty in includeProperties.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries))
            {
                query = query.Include(includeProperty);
            }

            if (take != null)
            {
                query = query.Take(take.Value);
            }

            if (orderBy != null)
            {
                return orderBy(query).ToList();
            }
            else
            {
                return query.ToList();
            }           
        }

        public Task<Stock> GetByID(int id)
        {
            return Task.FromResult(new Stock());
        }

        public Task<Stock> GetByID(long id)
        {
            return Task.FromResult(new Stock());
        }

        public Task<Stock> GetByID(string id)
        {
            return Task.FromResult(new Stock());
        }

        public Stock GetFirst(Expression<Func<Stock, bool>> filter = null, string includeProperties = "")
        {
            return Get(filter, null, includeProperties).FirstOrDefault();
        }

        public Task Insert(Stock entity)
        {
            _stocks.Add(entity);
            return CompletedTask;
        }

        public void Update(Stock entity)
        {
            var stock = Get(x => x.Deposito == entity.Deposito && x.Area == entity.Area && x.Pasillo == entity.Pasillo
                && x.Fila == entity.Fila && x.Cara == entity.Cara && x.ProductId == entity.ProductId).FirstOrDefault();
            stock.Cantidad = entity.Cantidad;
            
        }

        public async Task<IEnumerable<StockPorProducto>> GetStockPorProductoSP(string deposito, string ProductID)
        {
            var stock= Get(x => x.Deposito == deposito && x.ProductId == ProductID).ToList();
            var stockPorProducto = stock.Select(x => new StockPorProducto
            {
                deposito = x.Deposito,
                ubicacion = string.Format("{0}-{1}-{2}-{3}", x.Area, x.Pasillo, x.Fila, x.Cara),
                cantidad = x.Cantidad
            }).ToList();
            return (IEnumerable<StockPorProducto>)stockPorProducto;
        }
    }
}
