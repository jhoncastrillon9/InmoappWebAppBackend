using System;

namespace Entities.Properties
{
    public class IvaModel
    {
		public Int32 IvaId { get; set; }
		public Double Valor { get; set; }

    }

    public class IvaListModel
    {
		public Int32 IvaId { get; set; }
		public String IvaName { get; set; }

    }

    public class IvaPostModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 IvaId { get; set; }

    }

    public class IvaPutModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 IvaId { get; set; }

    }


    public class IvaDeleteModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 IvaId { get; set; }

    }

}
