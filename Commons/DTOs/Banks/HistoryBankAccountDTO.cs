using System;

namespace Commons.DTOs.Banks
{
    public class HistoryBankAccountDTO: ResponseSpDTO
	{
		public Int32 HistoryBankAccountId { get; set; }
		public Int32 PaymentTypeId { get; set; }
		public Decimal Value { get; set; }
		public Int32 BankAccountId { get; set; }
		public Int32? AccountsToPayContractsId { get; set; }
		public Int32? AccountsToReceivableContractsId { get; set; }
		public String Obervation { get; set; }
		public Int32 CompayId { get; set; }

    }

}
