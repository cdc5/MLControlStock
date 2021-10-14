using FundaGes.Core.DTOs;
using FundaGes.Core.Entities;
using FundaGes.Core.QueryFilters;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace FundaGes.Core.Interfaces
{
    public interface IEstablecimientoService
    {
        Task InsertEstablecimiento(EstablecimientoDto EstablecimientoDto);
        Task<bool> DeleteEstablecimiento(string id);
        EstablecimientoDto GetEstablecimiento(string id);
        IEnumerable<EstablecimientoDto> GetEstablecimientos(EstablecimientoQueryFilter filters);
        bool UpdateEstablecimiento(string Id, EstablecimientoDto EstablecimientoDto);

    }
}
