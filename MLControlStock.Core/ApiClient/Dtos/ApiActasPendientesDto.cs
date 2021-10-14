using System;
using System.Collections.Generic;
using System.Text;

namespace FundaGes.Core.ApiClient.Dtos
{
    public class ApiActasPendientesDto
    {

        public string usuarioCreador { get; set; }
        public List<ApiStockDto> stockCensado { get; set; }
        public bool? requiereConfirmacion { get; set; }
        public string fechaCarbunclo { get; set; }
        public string observaciones { get; set; }
        public string vacuna { get; set; }
        public string numeroSerie { get; set; }
        public bool? estaPaga { get; set; }
        public string renspa { get; set; }
        public bool? esActaTotal { get; set; }
        public string numeroSerieBrucelosis { get; set; }
        public string fechaConfirmacion { get; set; }
        public string campaniaCarga { get; set; }
        public long? id { get; set; }
        public string codigo { get; set; }
        public bool? carbunclo { get; set; }
        public string fechaVacunacion { get; set; }
        public string vacunador { get; set; }
        public int? cantidadDosis { get; set; }
        public List<ApiStockDto> stockVacunado { get; set; }
        public string usuarioAnulacion { get; set; }
        public string fechaCarga { get; set; }
        public bool? anulada { get; set; }
        public string usuarioConfirmacion { get; set; }
        public int? cantidadBubVacunadosBrucelosis { get; set; }
        public int? dosisBrucelosis { get; set; }        
        public int? cantidadVacunadosBrucelosis { get; set; }
        public string vacunaBrucelosis { get; set; }
        public string Estado { get; set; }


    }
}
