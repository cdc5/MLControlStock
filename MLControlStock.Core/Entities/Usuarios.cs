using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace FundaGes.Core.Entities
{
    public partial class Usuarios
    {
        public int Id { get; set; }
        public string Usuario { get; set; }
        public string Pass { get; set; }
        public DateTime? FechaCreacion { get; set; }
        public int? TipoUsuario { get; set; }
        public int? FundacionId { get; set; }

        public virtual Fundaciones Fundacion { get; set; }
        public virtual TiposUsuario TipoUsuarioNavigation { get; set; }
        public virtual MiembrosFundacion MiembrosFundacion { get; set; }
        public virtual Vacunadores Vacunadores { get; set; }
        public string NombreUsuario
        {
            get
            {
                if (TipoUsuario == Parametros.Fundacion.Id)
                    return MiembrosFundacion.Nombre;
                if (TipoUsuario == Parametros.Vacunador.Id)
                    return Vacunadores.Nombre;
                return String.Empty;
            }
            set {; }
        }

        public string Cuit
        {
            get
            {
                if (TipoUsuario == Parametros.Fundacion.Id)
                    return MiembrosFundacion.Cuit;
                if (TipoUsuario == Parametros.Vacunador.Id)
                    return Vacunadores.Cuit;
                return String.Empty;
            }
            set {; }
        }

        public int? IDMiembroFundOVacunador
        {
            get
            {
                if (TipoUsuario == Parametros.Fundacion.Id)
                    return MiembrosFundacion.Id;
                if (TipoUsuario == Parametros.Vacunador.Id)
                    return Vacunadores.Id;
                return null;
            }
            set {; }
        }
    }
}
