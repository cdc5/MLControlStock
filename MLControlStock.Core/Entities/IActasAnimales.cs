using System;
using System.Collections.Generic;
using System.Text;

namespace FundaGes.Core.Entities
{
    public interface IActasAnimales
    {
        int AnimalesID { get; set; }
        string AnimalesNombre { get; set; }
        string AnimalesCodigo { get; set; }
    }
}
