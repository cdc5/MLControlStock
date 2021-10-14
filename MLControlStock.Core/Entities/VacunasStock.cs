using FundaGes.Core.Exceptions;
using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace FundaGes.Core.Entities
{
    public partial class VacunasStock
    {
        public VacunasStock()
        {
            TurnosVacunas = new HashSet<TurnosVacunas>();
        }

        public int Id { get; set; }
        public int? VacunasId { get; set; }
        public int? EstadoId { get; set; }
        public DateTime? FechaCreacion { get; set; }
        public DateTime? FechaVencimiento { get; set; }
        public int? HeladeraId { get; set; }
        public int? Cantidad { get; set; }
        public int? Partida { get; set; }
        public int? FundacionId { get; set; }
        public int? SubcentroId { get; set; }
        

        public virtual Estados Estado { get; set; }
        public virtual Fundaciones Fundacion { get; set; }
        public virtual Heladeras Heladera { get; set; }
        public virtual Subcentros Subcentro { get; set; }
        public virtual Vacunas Vacunas { get; set; }
        public virtual ICollection<TurnosVacunas> TurnosVacunas { get; set; }

        public int? IncrementarStock(int inc)
        {
            return Cantidad += inc;            
        }

        public int? DisminuirStock(int dis)
        {
            if (dis > Cantidad)
                throw new BusinessException("La cantidad solicitada supera el stock disponible");
            return Cantidad -= dis;
        }
    }
}
