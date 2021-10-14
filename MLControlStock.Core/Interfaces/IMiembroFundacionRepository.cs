using FundaGes.Core.Entities;

namespace FundaGes.Core.Interfaces
{
    public interface IMiembroFundacionRepository : IRepository<MiembrosFundacion>
    {
        MiembrosFundacion GetMiembroPorCuit(string Cuit);
    }
}
