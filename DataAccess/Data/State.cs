using System;
using System.Collections.Generic;

namespace DataAccess.Data
{
    public partial class State
    {
        public State()
        {
            City = new HashSet<City>();
        }

        public int StateId { get; set; }
        public string StateName { get; set; }

        public ICollection<City> City { get; set; }
    }
}
