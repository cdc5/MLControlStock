using System;
using System.Collections.Generic;
using System.Text;

namespace FundaGes.Core.DTOs
{
    public class FundacionDtoOut
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public DateTime? FechaCreacion { get; set; }
        public string Cuit { get; set; }
        public string TokenSenasa { get; set; }
        public int? UsuarioId { get; set; }
    }
}
