using System;
using System.Collections.Generic;

namespace DataAccess.Data
{
    public partial class Iva
    {
        public Iva()
        {
            Property = new HashSet<Property>();
        }

        public int IvaId { get; set; }
        public double Valor { get; set; }

        public ICollection<Property> Property { get; set; }
    }
}
