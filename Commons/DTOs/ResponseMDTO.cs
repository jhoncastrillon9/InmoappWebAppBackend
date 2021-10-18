﻿using System;
using System.Collections.Generic;
using System.Text;

namespace Commons.DTOs
{
    public class ResponseMDTO
    {
        public dynamic data { get; set; }
        public bool executionError { get; set; }
        public string message { get; set; }

        public ResponseMDTO()
        {
            data = null;
            executionError = false;
            message = "Proceso finalizado exitosamente";
        }

        public ResponseMDTO(dynamic _d, bool _e, string _m = "")
        {
            data = _d;
            executionError = _e;
            message = _m;
        }
    }
}