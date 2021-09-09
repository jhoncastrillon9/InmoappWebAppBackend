using System;

namespace Entities.Contracts
{
    public class ContractsStatusModel
    {
		public Int32 ContractsStatusId { get; set; }
		public String ContractsStatusName { get; set; }

    }

    public class ContractsStatusListModel
    {
		public Int32 ContractsStatusId { get; set; }
		public String ContractsStatusName { get; set; }

    }

    public class ContractsStatusPostModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 ContractsStatusId { get; set; }

    }

    public class ContractsStatusPutModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 ContractsStatusId { get; set; }

    }


    public class ContractsStatusDeleteModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 ContractsStatusId { get; set; }

    }

}
