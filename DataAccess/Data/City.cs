using System;
using System.Collections.Generic;

namespace DataAccess.Data
{
    public partial class City
    {
        public City()
        {
            Property = new HashSet<Property>();
            Zone = new HashSet<Zone>();
        }

        public int CityId { get; set; }
        public string CityName { get; set; }
        public int StateId { get; set; }

        public State State { get; set; }
        public ICollection<Property> Property { get; set; }
        public ICollection<Zone> Zone { get; set; }
    }
}
