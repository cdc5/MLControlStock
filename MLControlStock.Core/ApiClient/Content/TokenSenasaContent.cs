using System;
using System.Collections.Generic;
using System.Text;

namespace FundaGes.Core.ApiClient.Content
{
    public class TokenSenasaContent
    {
        public string cuit { get; set; }
        public string wsUsername { get; set; }
        public string wsToken { get; set; }

        public TokenSenasaContent(string _cuit, string _wsUsername, string _wsToken)
        {
            cuit = _cuit;
            wsUsername = _wsUsername;
            wsToken = _wsToken;
        }
    }
}
