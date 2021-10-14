﻿using System;
using System.Collections.Generic;
using System.Text;

namespace FundaGes.Core.Exceptions
{
    public class BusinessException:Exception
    {
        public BusinessException()
        {

        }

        public BusinessException(string message):base(message)
        {
            
        }

        private static string ifNull(string message)
        {
            if (message == null)
                return "Sin error retornado desde Api Senasa";
            return message;
        }
    }
}
