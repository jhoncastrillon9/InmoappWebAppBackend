using System;
using System.Collections.Generic;

namespace DataAccess.Data
{
    public partial class Owner
    {
        public Owner()
        {
            Property = new HashSet<Property>();
        }

        public int OwnerId { get; set; }
        public string OwnerName { get; set; }
        public string Document { get; set; }
        public string Telephone { get; set; }
        public string Mobile { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string Observation { get; set; }
        public int CompayId { get; set; }

        public Company Compay { get; set; }
        public ICollection<Property> Property { get; set; }
    }
}
