using System;
using System.Collections.Generic;
using System.Text;

namespace FundaGes.Core.ApiClient.Content
{
    public class ActasPendientesContent
    {
        public string cuit { get; set; }
        public string wsUsername { get; set; }
        public string wsToken { get; set; }
        public string campania { get; set; }

        public ActasPendientesContent(string _cuit, string _wsUsername, string _wsToken,string _campania)
        {
            cuit = _cuit;
            wsUsername = _wsUsername;
            wsToken = _wsToken;
            campania = _campania;
        }
    }
}
