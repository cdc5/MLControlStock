using FundaGes.Core.DTOs;
using System.Collections.Generic;
using System.Threading.Tasks;
using FundaGes.Core.Entities;
using FundaGes.Core.QueryFilters;

namespace FundaGes.Core.Interfaces
{
    public interface IVacunadorService
    {
        Task<VacunadorDtoOut> GetVacunador(int id);
        //IEnumerable<VacunadorDtoOut> GetVacunadores();
        IEnumerable<VacunadorDtoOut> GetVacunadores(VacunadorQueryFilter filters);
        Vacunadores GetVacunadorPorCuit(string Cuit);
        Task InsertVacunador(VacunadorDto VacunadorDto);
        Task<bool> UpdateVacunador(int id, VacunadorUpdateDto VacunadorDto);
        void UpdateVacunador(Vacunadores vacunador);
        Task<bool> DeleteVacunador(int id);
    }
}
