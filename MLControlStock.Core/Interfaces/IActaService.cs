using FundaGes.Core.ApiClient.Dtos;
using FundaGes.Core.DTOs;
using FundaGes.Core.Entities;
using FundaGes.Core.QueryFilters;
using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;

namespace FundaGes.Core.Interfaces
{
    public interface IActaService
    {

        Task<IEnumerable<ActaDto>> GetActasDto(ActaQueryFilter filters, ClaimsPrincipal User);
        Task<Actas> GetActa(long id, ClaimsPrincipal User);
        Task<Actas> GetActa(string codigo, ClaimsPrincipal User);
        Task<IEnumerable<ApiActasDto>> GetActasSenasa(string campania, ClaimsPrincipal User);
        Task<IEnumerable<ApiActasPendientesDto>> GetActaSenasa(string campania, string codigo, ClaimsPrincipal User);
        Task InsertActaDto(ActaDto actaDto, int EstadoID, ClaimsPrincipal User);
        Task<bool> UpdateActa(ActaUpdateDto ActaUpdateDto, ClaimsPrincipal User);
        Task<bool> UpdateActaID(string codigo, long id, ClaimsPrincipal User);
        Task<long> CambiarEstadoActaFundacion(string codigo, ActaEstadoDto ActaEstadoDto, ClaimsPrincipal User);
        Task<long?> CambiarEstadoActaSenasa(long id, string codigo, string campania, string Estado, ClaimsPrincipal User);
        Task<bool> DeleteActa(string codigo, ClaimsPrincipal User);
        Task<IEnumerable<ApiActasPendientesDto>> GetActasPendientesSenasa(string campania, ClaimsPrincipal User);
        Task<IEnumerable<ApiActasPendientesDto>> GetActasPendientesFundacion(string campania, ClaimsPrincipal User);
        Task<IEnumerable<ApiActasPendientesDto>> GetActasPendientes(string campania, ClaimsPrincipal User);        
    }
}