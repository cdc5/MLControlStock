using MLControlStock.Core.ApiClient.Dtos;
using MLControlStock.Core.DTOs;
using MLControlStock.Core.Entities;
using MLControlStock.Core.QueryFilters;
using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;

namespace MLControlStock.Core.Interfaces
{
    public interface IStockService
    {

        //Task<IEnumerable<ActaDto>> GetActasDto(ActaQueryFilter filters, ClaimsPrincipal User);
        //Task<Actas> GetActa(long id, ClaimsPrincipal User);
        //Task<Actas> GetActa(string codigo, ClaimsPrincipal User);
        //Task<IEnumerable<ApiActasDto>> GetActasSenasa(string campania, ClaimsPrincipal User);
        
        //Task<bool> UpdateActaID(string codigo, long id, ClaimsPrincipal User);
        
        //Task<long?> CambiarEstadoActaSenasa(long id, string codigo, string campania, string Estado, ClaimsPrincipal User);
        //Task<bool> DeleteActa(string codigo, ClaimsPrincipal User);        
    }
}