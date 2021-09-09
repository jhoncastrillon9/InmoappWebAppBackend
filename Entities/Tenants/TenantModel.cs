using System;

namespace Entities.Tenants
{
    public class TenantModel
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

    public class TenantListModel
    {
		public Int32 TenantId { get; set; }
		public String TenantName { get; set; }

    }

    public class TenantPostModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 TenantId { get; set; }

    }

    public class TenantPutModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 TenantId { get; set; }

    }


    public class TenantDeleteModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 TenantId { get; set; }

    }

}
