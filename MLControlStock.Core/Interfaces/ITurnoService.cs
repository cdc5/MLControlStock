using FundaGes.Core.DTOs;
using FundaGes.Core.Entities;
using FundaGes.Core.QueryFilters;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace FundaGes.Core.Interfaces
{
    public interface ITurnoService
    {
        IEnumerable<Turnos> GetTurnos(TurnoQueryFilter filters);
        IEnumerable<TurnosDtoOut> GetTurnosDto(TurnoQueryFilter filters);
        Task<Turnos> GetTurno(int Id);
        Task InsertTurno(TurnosDto turnoDto);
        Task<bool> UpdateTurno(int id, TurnosUpdateDto turnoDto);
        Task<bool> DeleteTurno(int id);
    }
}