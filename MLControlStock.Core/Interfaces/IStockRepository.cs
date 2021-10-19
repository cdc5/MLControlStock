using MLControlStock.Core.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace MLControlStock.Core.Interfaces
{
    public interface IStockRepository : IRepository<Stock>
    {
        Task<IEnumerable<StockPorProducto>> GetStockPorProductoSP(string deposito, string ProductID);
    }
}
