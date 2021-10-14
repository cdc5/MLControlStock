using System;
using System.Collections.Generic;
using System.Text;

namespace FundaGes.Core.ApiClient.Content
{
    public class AnularActaContent
    {
        public string wsUsername { get; set; }
        public string wsToken { get; set; }
        public string id { get; set; }

        public AnularActaContent(string _wsUsername, string _wsToken,string _id)
        {
            wsUsername = _wsUsername;
            wsToken = _wsToken;
            id = _id;
        }
    }
}
