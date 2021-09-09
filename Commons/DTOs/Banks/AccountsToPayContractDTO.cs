using System;

namespace Commons.DTOs.Banks
{
    public class AccountsToPayContractDTO : ResponseSpDTO
	{
		public Int32 AccountsToPayContractId { get; set; }
		public Int32 QuotaNumber { get; set; }
		public Decimal Value { get; set; }
		public DateTime ExpirationDate { get; set; }
		public Int32? AccountsStatusId { get; set; }
		public Int32 ContractId { get; set; }
		public Int32 CompayId { get; set; }

    }

}
