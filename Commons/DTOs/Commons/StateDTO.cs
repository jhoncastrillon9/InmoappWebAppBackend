using System;
using System.Collections.Generic;
using System.Text;

namespace Commons.DTOs.Commons
{
    public class StateDTO: ResponseSpDTO
    {
        public Int32 StateId { get; set; }
        public String StateName { get; set; }
    }
}
