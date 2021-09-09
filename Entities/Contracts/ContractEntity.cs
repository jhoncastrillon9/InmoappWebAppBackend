using System;

namespace Entities.Contracts
{
    public class ContractEntity
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
}
