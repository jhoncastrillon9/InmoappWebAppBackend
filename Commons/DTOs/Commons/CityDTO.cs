using System;
using System.Collections.Generic;
using System.Text;

namespace Commons.DTOs.Commons
{
    public class CityDTO: ResponseSpDTO
    {
        public Int32 CityId { get; set; }
        public String CityName { get; set; }
        public Int32 StateId { get; set; }
    }
}
