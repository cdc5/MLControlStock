using FundaGes.Core.Entities;
using FundaGes.Core.Interfaces;
using FundaGes.Infrastructure.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace FundaGes.Infrastructure.Repositories
{
    public class UsuarioRepository : Repository<Usuarios>, IUsuarioRepository
    {
        public UsuarioRepository(FundaGesContext context) : base(context)
        {

        }

    }
}
