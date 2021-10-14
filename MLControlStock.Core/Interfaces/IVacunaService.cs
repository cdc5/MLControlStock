using FundaGes.Core.ApiClient.Dtos;
using FundaGes.Core.DTOs;
using FundaGes.Core.Entities;
using FundaGes.Core.QueryFilters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Security.Claims;
using System.Threading.Tasks;

namespace FundaGes.Core.Interfaces
{
    public interface IVacunaService
    {
        Task<bool> DeleteEntregaRecepcion(int id);
        Task<bool> DeleteVacuna(int id);
        Task<bool> DeleteVacunaStock(int id);
        IEnumerable<TurnosVacunas> GetEntregasRecepcionVacunas(Expression<Func<TurnosVacunas, bool>> filter = null, Func<IQueryable<TurnosVacunas>, IOrderedQueryable<TurnosVacunas>> orderBy = null, string includeProperties = "", int? take = null);
        IEnumerable<EntregaRecepcionVacunaDtoOut> GetEntregasRecepcionVacunas(ClaimsPrincipal User);
        Task<TurnosVacunas> GetEntregaRecepcionVacunas(int id);
        Task<TurnosVacunasDtoOut> GetEntregaRecepcionVacunasDto(int id);

        Task<IEnumerable<ApiVacunasDto>> GetVacunasSenasa(ClaimsPrincipal User);
        Vacunas GetVacuna(int id);
        VacunaDto GetVacunaDto(int id);
        IEnumerable<Vacunas> GetVacunas(Expression<Func<Vacunas, bool>> filter = null, Func<IQueryable<Vacunas>, IOrderedQueryable<Vacunas>> orderBy = null, string includeProperties = "", int? take = null);
        IEnumerable<VacunaDto> GetVacunasDto();
        IEnumerable<VacunasStock> GetVacunasStock(Expression<Func<VacunasStock, bool>> filter = null, Func<IQueryable<VacunasStock>, IOrderedQueryable<VacunasStock>> orderBy = null, string includeProperties = "", int? take = null);
        IEnumerable<VacunasStockDtoOut> GetVacunasStockDto(VacunasStockQueryFilter filters,ClaimsPrincipal User);
        VacunasStock GetVacunaStock(int id, ClaimsPrincipal User);
        Task<VacunasStock> GetVacunaStock(int id);
        VacunasStockDtoOut GetVacunaStockDto(int id, ClaimsPrincipal User);        
        Task InsertEntregaRecepcionVacuna(EntregaRecepcionVacunaDto EntregaRecepcionVacunaDto, ClaimsPrincipal User);
        Task InsertVacuna(VacunaDto VacunaDto);
        Task InsertVacuna(Vacunas Vac);
        Task InsertVacunaStock(VacunasStock VacunaStock);
        Task InsertVacunaStock(VacunaStockDto VacunaStockDto, ClaimsPrincipal User);
        Task<bool> TrasladarVacunas(int HelDesde, int HelHasta, int StockVacID, int cant, ClaimsPrincipal User);
        bool UpdateVacuna(int id, VacunaDto VacunaDto);
        bool UpdateVacunasStock(VacunasStock VacunasStock);
        Task<bool> UpdateVacunasStock(VacunaStockUpdateDto VacunaStockUpdateDto);

    }
}