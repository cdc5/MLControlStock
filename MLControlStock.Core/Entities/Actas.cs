using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace FundaGes.Core.Entities
{
    public partial class Actas
    {
        public Actas()
        {
            ActasAnimales = new HashSet<ActasAnimales>();
        }

        public long? Id { get; set; }
        public string UsuarioCreador { get; set; }
        public string NumeroSerieBrucelosis { get; set; }
        public string Observaciones { get; set; }
        public bool? EstaPaga { get; set; }
        public string NumeroSerie { get; set; }
        public string Renspa { get; set; }
        public string Codigo { get; set; }
        public string CampaniaCarga { get; set; }
        public bool? Carbunclo { get; set; }
        public int? CantidadDosis { get; set; }
        public int? CantidadBubVacunadosBrucelosis { get; set; }
        public int? DosisBrucelosis { get; set; }
        public bool? RequiereConfirmacion { get; set; }
        public DateTime? FechaCarbunclo { get; set; }
        public string Vacuna { get; set; }
        public bool? EsActaTotal { get; set; }
        public DateTime? FechaConfirmacion { get; set; }
        public int? CantidadVacunadosBrucelosis { get; set; }
        public string Vacunador { get; set; }
        public DateTime? FechaVacunacion { get; set; }
        public string UsuarioAnulacion { get; set; }
        public string VacunaBrucelosis { get; set; }
        public DateTime? FechaCarga { get; set; }
        public bool? Anulada { get; set; }
        public string UsuarioConfirmacion { get; set; }
        public int? FundacionId { get; set; }
        public int? Estado { get; set; }
         
        public string Identificacion { get; set; }

        public virtual Estados EstadoNavigation { get; set; }
        public virtual Fundaciones Fundacion { get; set; }
        public virtual ICollection<ActasAnimales> ActasAnimales { get; set; }
        public virtual ICollection<ActasAnimalesDDJJ> ActasAnimalesDDJJ { get; set; }

        public string NombreEstado
        {
            get
            {
                if (EstadoNavigation != null && EstadoNavigation.Nombre != null)
                    return EstadoNavigation.Nombre;
                else
                    return string.Empty;
            }
            set {; }
        }
    }
}
