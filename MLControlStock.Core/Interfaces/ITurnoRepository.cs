using FundaGes.Core.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace FundaGes.Core.Interfaces
{
    public interface ITurnoRepository:IRepository<Turnos>
    {
        Task<IEnumerable<Turnos>> GetTurnosPorUsuario(int usuarioID);
        

    }
}
