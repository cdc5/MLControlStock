using MLControlStock.Core.Entities;
using MLControlStock.Core.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace MlControlStock.UnitTests
{
    public class UnitOfWorkMock:IUnitOfWork
    {
        IRepository<Stock> IUnitOfWork.StockRepository => new StockRepositoryMock();

        public void Dispose()
        {
        
        }

        public void SaveChanges()
        {
        
        }

        public async Task SaveChangesAsync()
        {
        
        }
    }
}
