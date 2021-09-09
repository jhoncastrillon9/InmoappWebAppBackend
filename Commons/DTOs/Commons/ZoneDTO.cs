using System;
using System.Collections.Generic;
using System.Text;

namespace Commons.DTOs.Commons
{
    public class ZoneDTO: ResponseSpDTO
    {
        public Int32 ZoneId { get; set; }
        public String ZoneName { get; set; }
        public Int32 CityId { get; set; }
    }
}
