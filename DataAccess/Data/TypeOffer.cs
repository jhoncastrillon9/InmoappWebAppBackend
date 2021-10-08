using System;
using System.Collections.Generic;

namespace DataAccess.Data
{
    public partial class TypeOffer
    {
        public TypeOffer()
        {
            Property = new HashSet<Property>();
        }

        public int TypeOfferId { get; set; }
        public string TypeOfferName { get; set; }

        public ICollection<Property> Property { get; set; }
    }
}
