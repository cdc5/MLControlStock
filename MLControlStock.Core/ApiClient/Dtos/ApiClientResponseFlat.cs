﻿using System;
using System.Collections.Generic;
using System.Text;

namespace FundaGes.Core.ApiClient.Dtos
{
    public class ApiClientResponseFlat
    {
        public string Data { get; set; }
        public bool ok { get; set; }
        public int code { get; set; }
        public string warning { get; set; }
    }
}