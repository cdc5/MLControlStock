using System;
using System.Collections.Generic;
using System.Text;

namespace FundaGes.Core.DTOs
{
    public class EntregaRecepcionVacunaDtoOut
    {
        public int Id { get; set; }
        public string Tipo { get; set; }
        public string VacunadorCuit { get; set; }
        public string VacunadorNombre { get; set; }
        public DateTime? Fecha { get; set; }
        public string Vacuna { get; set; }
        public string Partida { get; set; }
        public decimal Temperatura { get; set; }
        public int Dosis { get; set; }
        public string Turno { get; set; }
    }
}
