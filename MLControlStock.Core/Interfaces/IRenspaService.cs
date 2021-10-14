using FundaGes.Core.DTOs;
using FundaGes.Core.Entities;
using FundaGes.Core.QueryFilters;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace FundaGes.Core.Interfaces
{
    public interface IRenspaService
    {
        Task InsertRenspa(RenspaDto renspaDto);
        Task<bool> DeleteRenspa(string id);
        Task<Renspas> GetRenspa(string id);
        Task<RenspaDto> GetRenspaDto(string id);
        IEnumerable<Renspas> GetRenspas();
        IEnumerable<RenspaDto> GetRenspasDto();
        IEnumerable<string> GetRenspasPorEstablecimiento(string establecimiento);
        bool UpdateRenspa(string Renspa, RenspaDto RenspaDto);
    }
}
