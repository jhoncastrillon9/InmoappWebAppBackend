using System;
using System.Collections.Generic;

namespace DataAccess.Data
{
    public partial class Zone
    {
        public Zone()
        {
            Neighborhood = new HashSet<Neighborhood>();
            Property = new HashSet<Property>();
        }

        public int ZoneId { get; set; }
        public string ZoneName { get; set; }
        public int CityId { get; set; }

        public City City { get; set; }
        public ICollection<Neighborhood> Neighborhood { get; set; }
        public ICollection<Property> Property { get; set; }
    }
}
