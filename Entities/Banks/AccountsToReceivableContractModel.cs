using System;

namespace Entities.Banks
{
    public class AccountsToReceivableContractModel
    {
		public Int32 AccountsToReceivableContractId { get; set; }
		public Int32 QuotaNumber { get; set; }
		public Decimal Value { get; set; }
		public DateTime ExpirationDate { get; set; }
		public Int32? AccountsStatusId { get; set; }
		public Int32 ContractId { get; set; }
		public Int32 CompayId { get; set; }

    }

    public class AccountsToReceivableContractListModel
    {
		public Int32 AccountsToReceivableContractId { get; set; }
		public String AccountsToReceivableContractName { get; set; }

    }

    public class AccountsToReceivableContractPostModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 AccountsToReceivableContractId { get; set; }

    }

    public class AccountsToReceivableContractPutModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 AccountsToReceivableContractId { get; set; }

    }


    public class AccountsToReceivableContractDeleteModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 AccountsToReceivableContractId { get; set; }

    }

}
