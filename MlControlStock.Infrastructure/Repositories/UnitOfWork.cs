using MLControlStock.Core.Entities;
using MLControlStock.Core.Interfaces;
using MLControlStock.Infrastructure.Data;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace MLControlStock.Infrastructure.Repositories
{
    public class UnitOfWork:IUnitOfWork
    {
        private readonly MLControlStockContext _context;
        private readonly IRepository<Stock> _stockRepository;
       

        public UnitOfWork(MLControlStockContext context)
        {
            _context = context;
        }

        public IRepository<Stock> StockRepository => _stockRepository ?? new Repository<Stock>(_context);
        
        public void Dispose()
        {
            if (_context != null)
                _context.Dispose();
        }

        public void SaveChanges()
        {
            _context.SaveChanges();
        }

        public async Task SaveChangesAsync()
        {
            await _context.SaveChangesAsync();
        }
    }
}
