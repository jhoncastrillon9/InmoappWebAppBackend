using System;
using System.Collections.Generic;

namespace DataAccess.Data
{
    public partial class PropertyCategory
    {
        public PropertyCategory()
        {
            Property = new HashSet<Property>();
        }

        public int PropertyCategoryId { get; set; }
        public string CategoryName { get; set; }

        public ICollection<Property> Property { get; set; }
    }
}
