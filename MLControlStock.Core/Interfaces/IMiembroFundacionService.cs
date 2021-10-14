using FundaGes.Core.DTOs;
using System.Collections.Generic;
using System.Threading.Tasks;
using FundaGes.Core.Entities;
using FundaGes.Core.QueryFilters;

namespace FundaGes.Core.Interfaces
{
    public interface IMiembroFundacionService
    {    
        Task<MiembroFundacionDtoOut> GetMiembroFundacion(int id);
        //IEnumerable<MiembroFundacionDtoOut> GetMiembroFundaciones();
        IEnumerable<MiembroFundacionDtoOut> GetMiembrosFundacion(MiembroFundacionQueryFilter filters);
        Task InsertMiembroFundacion(MiembroFundacionDto MiembroFundacionDto);
        Task<bool> UpdateMiembroFundacion(int id, MiembroFundacionUpdateDto MiembroFundacionDto);
        void UpdateMiembroFundacion(MiembrosFundacion MiembroFundacion);
        Task<bool> DeleteMiembroFundacion(int id);
    }
}
