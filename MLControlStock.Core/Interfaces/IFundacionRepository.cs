using FundaGes.Core.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace FundaGes.Core.Interfaces
{
    public interface IFundacionRepository : IRepository<Fundaciones>
    {
        Fundaciones GetFundacionPorCuit(string Cuit);
    }
}
