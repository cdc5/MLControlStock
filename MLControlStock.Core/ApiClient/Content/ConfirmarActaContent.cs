using System;
using System.Collections.Generic;
using System.Text;

namespace FundaGes.Core.ApiClient.Content
{
    public class ConfirmarActaContent
    {
        public string cuit { get; set; }
        public string wsUsername { get; set; }
        public string wsToken { get; set; }
        public string id { get; set; }

        public ConfirmarActaContent(string _cuit, string _wsUsername, string _wsToken,string _id)
        {
            cuit = _cuit;
            wsUsername = _wsUsername;
            wsToken = _wsToken;
            id = _id;
        }
    }
}
