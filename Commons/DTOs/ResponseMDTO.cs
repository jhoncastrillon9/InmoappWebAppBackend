using Commons.Resources;
using System;
using System.Collections.Generic;
using System.Text;

namespace Commons.DTOs
{
    public class ResponseMDTO
    {
        public dynamic Data { get; set; }
        public bool ExecutionError { get; set; }
        public string Message { get; set; }

        /// <summary>
        /// DTO generico para responder a branwhite
        /// </summary>
        public ResponseMDTO()
        {
            Data = null;
            ExecutionError = false;
            Message = Messages.SuccessGeneral;
        }

        public ResponseMDTO(dynamic _dynamic, bool _executionError, string _message = "")
        {
            Data = _dynamic;
            ExecutionError = _executionError;
            Message = _message;
        }
    }
}
