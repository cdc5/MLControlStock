using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace FundaGes.Core.Entities
{
    public partial class TurnosVacunas
    {
        public int? TurnosId { get; set; }
        public int VacunasStockId { get; set; }
        public int? CantidadEntregada { get; set; }
        public decimal? TemperaturaSalida { get; set; }
        public DateTime? FechaDevolucion { get; set; }
        public DateTime? FechaEntrega { get; set; }
        public int? CantidadDevolucion { get; set; }
        public decimal? TemperaturaDevolucion { get; set; }
        public int? FundacionId { get; set; }
        public int Id { get; set; }
        public string VacunadorCuit { get; set; }
        public string VacunadorNombre { get; set; }


        public virtual Turnos Turnos { get; set; }
        public virtual VacunasStock VacunasStock { get; set; }

        public bool TieneDevolucion()
        {
            if ((FechaDevolucion != null) && (CantidadDevolucion != null) && (FechaEntrega != null) && (CantidadEntregada != null))
                return true;
            else
                return false;
        }
        
    }
}
