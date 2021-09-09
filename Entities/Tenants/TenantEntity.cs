using System;

namespace Entities.Tenants
{
    public class TenantEntity
    {
		public Int32 TenantId { get; set; }
		public String TenantName { get; set; }
		public String Document { get; set; }
		public String Telephone { get; set; }
		public String Mobile { get; set; }
		public String Email { get; set; }
		public String Address { get; set; }
		public String Observation { get; set; }
		public Int32 CompayId { get; set; }

    }
}
