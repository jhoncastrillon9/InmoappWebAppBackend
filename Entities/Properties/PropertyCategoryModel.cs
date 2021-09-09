using System;

namespace Entities.Properties
{
    public class PropertyCategoryModel
    {
		public Int32 PropertyCategoryId { get; set; }
		public String CategoryName { get; set; }

    }

    public class PropertyCategoryListModel
    {
		public Int32 PropertyCategoryId { get; set; }
		public String PropertyCategoryName { get; set; }

    }

    public class PropertyCategoryPostModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 PropertyCategoryId { get; set; }

    }

    public class PropertyCategoryPutModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 PropertyCategoryId { get; set; }

    }


    public class PropertyCategoryDeleteModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 PropertyCategoryId { get; set; }

    }

}
