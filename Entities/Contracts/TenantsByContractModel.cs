using System;

namespace Entities.Contracts
{
    public class TenantsByContractModel
    {
		public Int32 TenantsByContractId { get; set; }
		public Int32 TenantId { get; set; }
		public String Profile { get; set; }

    }

    public class TenantsByContractListModel
    {
		public Int32 TenantsByContractId { get; set; }
		public String TenantsByContractName { get; set; }

    }

    public class TenantsByContractPostModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 TenantsByContractId { get; set; }

    }

    public class TenantsByContractPutModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 TenantsByContractId { get; set; }

    }


    public class TenantsByContractDeleteModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 TenantsByContractId { get; set; }

    }

}
