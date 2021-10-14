using FundaGes.Core.Entities;

namespace FundaGes.Core.Interfaces
{
    public interface IVacunadorRepository : IRepository<Vacunadores>
    {
        Vacunadores GetVacunadorPorCuit(string Cuit);
    }
}
