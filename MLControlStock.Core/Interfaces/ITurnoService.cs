using MLControlStock.Core.DTOs;
using MLControlStock.Core.Entities;
using MLControlStock.Core.QueryFilters;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MLControlStock.Core.Interfaces
{
    public interface ITurnoService
    {
        IEnumerable<Turnos> GetTurnos(TurnoQueryFilter filters);
        //IEnumerable<TurnosDtoOut> GetTurnosDto(TurnoQueryFilter filters);
        Task<Turnos> GetTurno(int Id);
        //Task InsertTurno(TurnosDto turnoDto);
        //Task<bool> UpdateTurno(int id, TurnosUpdateDto turnoDto);
        Task<bool> DeleteTurno(int id);
    }
}