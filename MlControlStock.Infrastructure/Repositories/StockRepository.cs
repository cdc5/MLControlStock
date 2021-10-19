using MLControlStock.Core.Entities;
using MLControlStock.Core.Interfaces;
using MLControlStock.Infrastructure.Data;
using MLControlStock.Infrastructure.Repositories;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace MlControlStock.Infrastructure.Repositories
{
    public class StockRepository : Repository<Stock>, IStockRepository
    {
        public StockRepository(MLControlStockContext context) : base(context)
        {

        }

        //Ejemplo de llamado a Stored Procedure
        public async Task<IEnumerable<StockPorProducto>> GetStockPorProductoSP(string deposito, string ProductID)
        {
            var stockPorProductos = await _context.StockPorProducto.FromSqlRaw("SP_ObtenerStockPorProducto {0},{1}", deposito, ProductID).ToListAsync();
           return stockPorProductos;

        }
    }
}
