using System;
using System.Collections.Generic;

namespace DataAccess.Data
{
    public partial class Neighborhood
    {
        public int NeighborhoodId { get; set; }
        public string NeighborhoodName { get; set; }
        public int ZoneId { get; set; }

        public Zone Zone { get; set; }
    }
}
