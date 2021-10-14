using System;

namespace FundaGes.Core.DTOs
{
    public class MiembroFundacionDtoOut
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public DateTime? FechaCreacion { get; set; }
        public string Cuit { get; set; }
        public int? UsuarioId { get; set; }
        public int? FundacionId { get; set; }
    }
}
