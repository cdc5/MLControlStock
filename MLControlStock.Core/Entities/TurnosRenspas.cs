using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace FundaGes.Core.Entities
{
    public partial class TurnosRenspas
    {
        public int TurnosId { get; set; }
        public string RenspasId { get; set; }

        public virtual Renspas Renspas { get; set; }
        public virtual Turnos Turnos { get; set; }
    }
}
