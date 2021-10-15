using MLControlStock.Core.Entities;
using System;
using System.Threading.Tasks;

namespace MLControlStock.Core.Interfaces
{
    public interface IUnitOfWork:IDisposable
    {
        IRepository<Stock> StockRepository { get; }
        void SaveChanges();
        Task SaveChangesAsync();
    }
}
