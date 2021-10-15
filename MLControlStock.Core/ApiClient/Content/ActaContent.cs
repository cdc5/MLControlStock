using System;
using System.Collections.Generic;
using System.Text;

namespace MLControlStock.Core.ApiClient.Content
{
    public class ActaContent
    {
        public string cuit { get; set; }
        public string wsUsername { get; set; }
        public string wsToken { get; set; }
        public string campania { get; set; }
        public string codigo { get; set; }

        public ActaContent(string _cuit, string _wsUsername, string _wsToken,string _campania, string _codigo)
        {
            cuit = _cuit;
            wsUsername = _wsUsername;
            wsToken = _wsToken;
            campania = _campania;
            codigo = _codigo;
        }
    }
}
