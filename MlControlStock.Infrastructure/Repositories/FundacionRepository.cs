using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FundaGes.Core.Entities;
using FundaGes.Core.Interfaces;
using FundaGes.Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

namespace FundaGes.Infrastructure.Repositories
{
    public class FundacionRepository : Repository<Fundaciones>, IFundacionRepository
    {
        public FundacionRepository(FundaGesContext context) : base(context)
        {

        }        

        public Fundaciones GetFundacionPorCuit(string Cuit)
        {
            return  _entities.Where(t => t.Cuit == Cuit).FirstOrDefault();
        }
    }
}
