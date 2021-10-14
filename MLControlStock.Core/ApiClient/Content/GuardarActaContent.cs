using System;
using System.Collections.Generic;
using System.Text;

namespace FundaGes.Core.ApiClient.Content
{
    public class GuardarActaContent
    {
        public string wsUsername { get; set; }
        public string wsToken { get; set; }
        public string renspa { get; set; }
        public string fechaVacunacion { get; set; }
        public string campania { get; set; }
        public string codigo { get; set; }
        public int vacuna { get; set; }
        public string serie { get; set; }
        public int dosis { get; set; }
        public bool total { get; set; }
        public string cuitVacunador { get; set; }
        public int vacunaBrucelosis { get; set; }
        public string serieBrucelosis { get; set; }
        public int dosisBrucelosis { get; set; }
        public bool carbunclo { get; set; }
        public int ternerasBrucelosis { get; set; }
        public int ternerasBubalinasBrucelosis { get; set; }
        public List<StockContent> stock { get; set; }
        public List<StockContent> stockDDJJ { get; set; }
        public string identificacion { get; set; }

        //public GuardarActaContent()
        //{
                
        //}


        //public GuardarActaContent(string _cuit, string _wsUsername, string _wsToken, string _renspa,string _fechaVacunacion,string _campania, string _codigo,
        //                        int _vacuna, string _serie, int _dosis, bool _total, string _cuitVacunador, int _vacunaBrucelosis, string _serieBrucelosis, int _dosisBrucelosis,
        //                        bool _carbunclo, int _ternerasBrucelosis, int _ternerasBubalinasBrucelosis, List<StockContent> _stock, List<StockContent> _stockDDJJ,
        //                        string _identificacion)
        //{
        //    wsUsername = _wsUsername;
        //    wsToken = _wsToken;
        //    renspa = _renspa;
        //    fechaVacunacion = _fechaVacunacion;
        //    campania = _campania;
        //    codigo = _codigo;
        //    vacuna = _vacuna;
        //    serie = _serie;
        //    dosis = _dosis;
        //    total = _total;
        //    cuitVacunador = _cuitVacunador;
        //    vacunaBrucelosis = _vacunaBrucelosis;
        //    serieBrucelosis = _serieBrucelosis;
        //    dosisBrucelosis = _dosisBrucelosis;
        //    carbunclo = _carbunclo;
        //    ternerasBrucelosis = _ternerasBrucelosis;
        //    ternerasBubalinasBrucelosis = _ternerasBubalinasBrucelosis;
        //    stock = _stock;
        //    stockDDJJ = _stockDDJJ;
        //    identificacion = _identificacion;
        //}


    }
}
