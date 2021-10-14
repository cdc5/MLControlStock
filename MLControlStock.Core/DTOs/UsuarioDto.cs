using System;
using System.Collections.Generic;
using System.Text;

namespace FundaGes.Core.DTOs
{
    public class UsuarioDto
    {
        public string Cuit { get; set; }
        public string Pass { get; set; }
        public string TipoUsuarioNombre { get; set; }        
        public string Nombre { get; set; }

        public string CuitFundacion { get; set; }

    }
}
