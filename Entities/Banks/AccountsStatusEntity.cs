using System;

namespace Entities.Banks
{
    public class AccountsStatusEntity
    {
		public Int32 AccountsStatusId { get; set; }
		public String AccountsStatusName { get; set; }

    }

    public class AccountsStatusListModel
    {
		public Int32 AccountsStatusId { get; set; }
		public String AccountsStatusName { get; set; }

    }

    public class AccountsStatusPostModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 AccountsStatusId { get; set; }

    }

    public class AccountsStatusPutModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 AccountsStatusId { get; set; }

    }


    public class AccountsStatusDeleteModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 AccountsStatusId { get; set; }

    }

}
