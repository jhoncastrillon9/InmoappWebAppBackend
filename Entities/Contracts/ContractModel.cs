using System;

namespace Entities.Contracts
{
    public class ContractModel
    {
		public Int32 ContractId { get; set; }
		public DateTime ContractDate { get; set; }
		public DateTime InnitialDate { get; set; }
		public Int32 QuantityMonths { get; set; }
		public Decimal RentalFeeForOwner { get; set; }
		public Decimal RentalFeeForTennat { get; set; }
		public String Observation { get; set; }
		public Int32? StatusId { get; set; }
		public Int32 PropertyId { get; set; }
		public Int32 TenantId { get; set; }
		public Int32 CompayId { get; set; }

    }

    public class ContractListModel
    {
		public Int32 ContractId { get; set; }
		public String ContractName { get; set; }

    }

    public class ContractPostModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 ContractId { get; set; }

    }

    public class ContractPutModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 ContractId { get; set; }

    }


    public class ContractDeleteModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 ContractId { get; set; }

    }

}
