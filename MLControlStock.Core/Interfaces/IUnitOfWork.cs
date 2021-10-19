using MLControlStock.Core.Entities;
using System;
using System.Threading.Tasks;

namespace MLControlStock.Core.Interfaces
{
    public interface IUnitOfWork:IDisposable
    {
        IStockRepository StockRepository { get; }
        void SaveChanges();
        Task SaveChangesAsync();
    }
}
