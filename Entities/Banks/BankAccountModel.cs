using System;

namespace Entities.Banks
{
    public class BankAccountModel
    {
		public Int32 BankAccountId { get; set; }
		public String BankAccountName { get; set; }
		public Decimal Total { get; set; }
		public Int32 CompayId { get; set; }

    }

    public class BankAccountListModel
    {
		public Int32 BankAccountId { get; set; }
		public String BankAccountName { get; set; }

    }

    public class BankAccountPostModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 BankAccountId { get; set; }

    }

    public class BankAccountPutModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 BankAccountId { get; set; }

    }


    public class BankAccountDeleteModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 BankAccountId { get; set; }

    }

}
