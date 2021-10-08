using System;
using System.Collections.Generic;

namespace DataAccess.Data
{
    public partial class Tenant
    {
        public Tenant()
        {
            Contract = new HashSet<Contract>();
            TenantsByContract = new HashSet<TenantsByContract>();
        }

        public int TenantId { get; set; }
        public string TenantName { get; set; }
        public string Document { get; set; }
        public string Telephone { get; set; }
        public string Mobile { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string Observation { get; set; }
        public int CompayId { get; set; }

        public Company Compay { get; set; }
        public ICollection<Contract> Contract { get; set; }
        public ICollection<TenantsByContract> TenantsByContract { get; set; }
    }
}
