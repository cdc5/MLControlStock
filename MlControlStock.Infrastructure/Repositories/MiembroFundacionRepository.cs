using FundaGes.Core.Entities;
using FundaGes.Core.Interfaces;
using FundaGes.Infrastructure.Data;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace FundaGes.Infrastructure.Repositories
{
    public class MiembroFundacionRepository : Repository<MiembrosFundacion>, IMiembroFundacionRepository
    {
        public MiembroFundacionRepository(FundaGesContext context) : base(context)
        {

        }

        public MiembrosFundacion GetMiembroPorCuit(string Cuit)
        {
            return _entities.Where(t => t.Cuit == Cuit).Include("Usuario").FirstOrDefault();
        }
    }
}
