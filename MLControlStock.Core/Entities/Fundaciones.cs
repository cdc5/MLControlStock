using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace FundaGes.Core.Entities
{
    public partial class Fundaciones
    {
        public Fundaciones()
        {
            Actas = new HashSet<Actas>();
            Establecimiento = new HashSet<Establecimiento>();
            Heladeras = new HashSet<Heladeras>();
            MiembrosFundacion = new HashSet<MiembrosFundacion>();
            Subcentros = new HashSet<Subcentros>();
            Turnos = new HashSet<Turnos>();
            Usuarios = new HashSet<Usuarios>();
            Vacunadores = new HashSet<Vacunadores>();
            VacunasStock = new HashSet<VacunasStock>();
        }

        public int Id { get; set; }
        public string Nombre { get; set; }
        public DateTime? FechaCreacion { get; set; }
        public string Cuit { get; set; }
        public string TokenSenasa { get; set; }
        public string wsUsername { get; set; }

        public virtual ICollection<Actas> Actas { get; set; }
        public virtual ICollection<Establecimiento> Establecimiento { get; set; }
        public virtual ICollection<Heladeras> Heladeras { get; set; }
        public virtual ICollection<MiembrosFundacion> MiembrosFundacion { get; set; }
        public virtual ICollection<Subcentros> Subcentros { get; set; }
        public virtual ICollection<Turnos> Turnos { get; set; }
        public virtual ICollection<Usuarios> Usuarios { get; set; }
        public virtual ICollection<Vacunadores> Vacunadores { get; set; }
        public virtual ICollection<VacunasStock> VacunasStock { get; set; }
    }
}
