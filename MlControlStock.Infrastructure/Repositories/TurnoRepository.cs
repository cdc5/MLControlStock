using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MLControlStock.Core.Entities;
using MLControlStock.Core.Interfaces;
using MLControlStock.Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

namespace MLControlStock.Infrastructure.Repositories
{
    public  class TurnoRepository:Repository<Turnos>,ITurnoRepository
    {

        public TurnoRepository(MLControlStockContext context):base(context)
        {
                
        }

        public async Task<IEnumerable<Turnos>> GetTurnosPorUsuario(int usuarioID)
        {
            return  await _entities.Where(t => t.UsuarioCreador == usuarioID).ToListAsync();
        }

       
    }
}
