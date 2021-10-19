using MLControlStock.Core.ApiClient.Dtos;
using MLControlStock.Core.DTOs;
using MLControlStock.Core.Entities;
using MLControlStock.Core.QueryFilters;
using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;

namespace MLControlStock.Core.Interfaces
{
    public interface IStockService
    {
        IEnumerable<StockDto> GetStock(string deposito, string ubicacion);
        IEnumerable<Stock> GetStock(string deposito, Ubicacion ubicacion);
        IEnumerable<StockPorProductoDto> GetStockPorProducto(string deposito, string producto);
        Task<Stock> AgregarProducto(string deposito, string ubicacion, string producto, int cantidad);
        Task<Stock> RetirarProducto(string deposito, string ubicacion, string producto, int cantidad);
    }
}