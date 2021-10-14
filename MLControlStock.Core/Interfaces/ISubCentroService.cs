using FundaGes.Core.DTOs;
using FundaGes.Core.Entities;
using FundaGes.Core.QueryFilters;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace FundaGes.Core.Interfaces
{
    public interface ISubCentroService
    {
        Task InsertSubCentro(SubCentroDto SubCentroDto);
        Task<bool> DeleteSubCentro(int id);
        SubCentroDtoOut GetSubCentro(int id);
        IEnumerable<SubCentroDtoOut> GetSubCentros(SubCentroQueryFilter filters);
        bool UpdateSubCentro(int id, SubCentroDto SubCentroDto);
    }
}
