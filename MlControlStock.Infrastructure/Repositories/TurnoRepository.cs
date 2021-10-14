using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FundaGes.Core.Entities;
using FundaGes.Core.Interfaces;
using FundaGes.Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

namespace FundaGes.Infrastructure.Repositories
{
    public  class TurnoRepository:Repository<Turnos>,ITurnoRepository
    {

        public TurnoRepository(FundaGesContext context):base(context)
        {
                
        }

        public async Task<IEnumerable<Turnos>> GetTurnosPorUsuario(int usuarioID)
        {
            return  await _entities.Where(t => t.UsuarioCreador == usuarioID).ToListAsync();
        }

       
    }
}
