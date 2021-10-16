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
        Task<IEnumerable<Stock>> GetStock(string deposito, string ubicacion);
        Task<Stock> AgregarProducto(string deposito, string ubicacion, string producto, int cantidad);
        Task<bool> RetirarProducto(string deposito, string ubicacion, string producto, int cantidad);
    }
}