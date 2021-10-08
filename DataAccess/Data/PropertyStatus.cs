using System;
using System.Collections.Generic;

namespace DataAccess.Data
{
    public partial class PropertyStatus
    {
        public PropertyStatus()
        {
            Property = new HashSet<Property>();
        }

        public int PropertyStatusId { get; set; }
        public string PropertyStatusName { get; set; }

        public ICollection<Property> Property { get; set; }
    }
}
