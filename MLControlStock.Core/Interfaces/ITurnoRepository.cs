using MLControlStock.Core.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MLControlStock.Core.Interfaces
{
    public interface ITurnoRepository:IRepository<Turnos>
    {
        Task<IEnumerable<Turnos>> GetTurnosPorUsuario(int usuarioID);        

    }
}
