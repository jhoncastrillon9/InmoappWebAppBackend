using System;

namespace Entities.Banks
{
    public class AccountsToPayContractModel
    {
		public Int32 AccountsToPayContractId { get; set; }
		public Int32 QuotaNumber { get; set; }
		public Decimal Value { get; set; }
		public DateTime ExpirationDate { get; set; }
		public Int32? AccountsStatusId { get; set; }
		public Int32 ContractId { get; set; }
		public Int32 CompayId { get; set; }

    }

    public class AccountsToPayContractListModel
    {
		public Int32 AccountsToPayContractId { get; set; }
		public String AccountsToPayContractName { get; set; }

    }

    public class AccountsToPayContractPostModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 AccountsToPayContractId { get; set; }

    }

    public class AccountsToPayContractPutModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 AccountsToPayContractId { get; set; }

    }


    public class AccountsToPayContractDeleteModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 AccountsToPayContractId { get; set; }

    }

}
