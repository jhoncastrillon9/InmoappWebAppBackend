using System;

namespace Entities.Banks
{
    public class HistoryBankAccountEntity
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

    public class HistoryBankAccountListModel
    {
		public Int32 HistoryBankAccountId { get; set; }
		public String HistoryBankAccountName { get; set; }

    }

    public class HistoryBankAccountPostModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 HistoryBankAccountId { get; set; }

    }

    public class HistoryBankAccountPutModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 HistoryBankAccountId { get; set; }

    }


    public class HistoryBankAccountDeleteModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 HistoryBankAccountId { get; set; }

    }

}
