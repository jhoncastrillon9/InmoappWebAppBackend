using System;

namespace Entities.Banks
{
    public class PaymentTypeModel
    {
		public Int32 PaymentTypeId { get; set; }
		public String PaymentTypeName { get; set; }
		public Int32 CompayId { get; set; }

    }

    public class PaymentTypeListModel
    {
		public Int32 PaymentTypeId { get; set; }
		public String PaymentTypeName { get; set; }

    }

    public class PaymentTypePostModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 PaymentTypeId { get; set; }

    }

    public class PaymentTypePutModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 PaymentTypeId { get; set; }

    }


    public class PaymentTypeDeleteModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 PaymentTypeId { get; set; }

    }

}
