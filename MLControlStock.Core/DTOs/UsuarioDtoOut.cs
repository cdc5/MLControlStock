using System;
using System.Collections.Generic;
using System.Text;

namespace FundaGes.Core.DTOs
{
    public class UsuarioDtoOut
    {
        public int Id { get; set; }
        public string Usuario { get; set; }
        public string NombreUsuario { get; set; }
        public DateTime? FechaCreacion { get; set; }
        public int? TipoUsuario { get; set; }
        public string  TipoUsuarioNombre { get; set; }
        public int IDMiembroFundOVacunador { get; set; }
        

    }
}
