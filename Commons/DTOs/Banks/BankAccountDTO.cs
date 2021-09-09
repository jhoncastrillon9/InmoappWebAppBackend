using System;

namespace Commons.DTOs.Banks
{
    public class BankAccountDTO : ResponseSpDTO
	{
		public Int32 BankAccountId { get; set; }
		public String BankAccountName { get; set; }
		public Decimal Total { get; set; }
		public Int32 CompayId { get; set; }

    }
}
