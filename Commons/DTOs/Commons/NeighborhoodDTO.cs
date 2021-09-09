using System;
using System.Collections.Generic;
using System.Text;

namespace Commons.DTOs.Commons
{
    public class NeighborhoodDTO: ResponseSpDTO
    {
        public Int32 NeighborhoodId { get; set; }
        public String NeighborhoodName { get; set; }
        public Int32 ZoneId { get; set; }
    }
}
