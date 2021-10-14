using FundaGes.Core.DTOs;
using FundaGes.Core.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;


namespace FundaGes.Core.Interfaces
{
    public interface IFundacionService
    {
        FundacionDtoOut GetFundacionDto(int id);
        Fundaciones GetFundacion(int id);
        IEnumerable<FundacionDtoOut> GetFundaciones();
        Fundaciones GetFundacionPorCuit(string Cuit);
        Task InsertFundacion(Fundaciones fund);
        Task InsertFundacion(FundacionDto FundacionDto);
        Task<bool> UpdateFundacion(int id, FundacionUpdateDto FundacionUpdateDto);
        void UpdateFundacion(Fundaciones fundacion);
        Task<bool> DeleteFundacion(int id);
    }
}
