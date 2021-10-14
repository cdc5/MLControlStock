using FundaGes.Core.Entities;
using FundaGes.Core.Interfaces;
using FundaGes.Infrastructure.Data;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace FundaGes.Infrastructure.Repositories
{
    public class VacunadorRepository : Repository<Vacunadores>, IVacunadorRepository
    {
        public VacunadorRepository(FundaGesContext context) : base(context)
        {

        }

        public Vacunadores GetVacunadorPorCuit(string Cuit)
        {
            return _entities.Where(t => t.Cuit == Cuit).Include("Usuario").FirstOrDefault();
        }
    }
}
