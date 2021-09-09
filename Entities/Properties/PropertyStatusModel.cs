using System;

namespace Entities.Properties
{
    public class PropertyStatusModel
    {
		public Int32 PropertyStatusId { get; set; }
		public String PropertyStatusName { get; set; }

    }

    public class PropertyStatusListModel
    {
		public Int32 PropertyStatusId { get; set; }
		public String PropertyStatusName { get; set; }

    }

    public class PropertyStatusPostModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 PropertyStatusId { get; set; }

    }

    public class PropertyStatusPutModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 PropertyStatusId { get; set; }

    }


    public class PropertyStatusDeleteModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 PropertyStatusId { get; set; }

    }

}
