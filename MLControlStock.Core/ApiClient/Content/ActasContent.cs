using System;
using System.Collections.Generic;
using System.Text;

namespace FundaGes.Core.ApiClient.Content
{
    public class ActasContent
    {
        public string cuit { get; set; }
        public string wsUsername { get; set; }
        public string wsToken { get; set; }
        public string codigo { get; set; }

        public ActasContent(string _cuit, string _wsUsername, string _wsToken,string _codigo)
        {
            cuit = _cuit;
            wsUsername = _wsUsername;
            wsToken = _wsToken;
            codigo = _codigo;
        }
    }
}
