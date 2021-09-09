using System;

namespace Commons.DTOs.Banks
{
    public class PaymentTypeDTO:ResponseSpDTO
    {
		public Int32 PaymentTypeId { get; set; }
		public String PaymentTypeName { get; set; }
		public Int32 CompayId { get; set; }

    }

}
