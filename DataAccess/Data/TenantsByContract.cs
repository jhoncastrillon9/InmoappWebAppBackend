using System;
using System.Collections.Generic;

namespace DataAccess.Data
{
    public partial class TenantsByContract
    {
        public int TenantsByContractId { get; set; }
        public int TenantId { get; set; }
        public string Profile { get; set; }

        public Tenant Tenant { get; set; }
    }
}
