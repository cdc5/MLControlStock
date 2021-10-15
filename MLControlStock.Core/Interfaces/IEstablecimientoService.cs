using MLControlStock.Core.DTOs;
using MLControlStock.Core.Entities;
using MLControlStock.Core.QueryFilters;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MLControlStock.Core.Interfaces
{
    public interface IEstablecimientoService
    {
        //Task InsertEstablecimiento(EstablecimientoDto EstablecimientoDto);
        Task<bool> DeleteEstablecimiento(string id);
        //EstablecimientoDto GetEstablecimiento(string id);
        //IEnumerable<EstablecimientoDto> GetEstablecimientos(EstablecimientoQueryFilter filters);
        //bool UpdateEstablecimiento(string Id, EstablecimientoDto EstablecimientoDto);

    }
}
