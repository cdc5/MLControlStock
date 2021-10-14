using FundaGes.Core.DTOs;
using FundaGes.Core.Entities;
using FundaGes.Core.QueryFilters;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace FundaGes.Core.Interfaces
{
    public interface IHeladeraService
    {
        Task InsertHeladera(HeladeraDto HeladeraDto);
        Task<bool> DeleteHeladera(int id);
        HeladeraDtoOut GetHeladeraDto(int id);
        Heladeras GetHeladera(int id);
        IEnumerable<HeladeraDtoOut> GetHeladeras(HeladeraQueryFilter filters);
        bool UpdateHeladera(int id, HeladeraDto HeladeraDto);
    }
}
