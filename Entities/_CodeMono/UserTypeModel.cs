using System;

namespace CodeMono.Entities
{
    public class UserTypeModel
    {
		public Int16 UserTypeId { get; set; }
		public String UserTypeName { get; set; }
		public Int32 CreatedBy { get; set; }
		public DateTime CreatedAt { get; set; }
		public Int32 UpdatedBy { get; set; }
		public DateTime UpdatedAt { get; set; }
		public Int32 DisabledBy { get; set; }
		public DateTime DisabledAt { get; set; }
		public Boolean Active { get; set; }
    }


    public class UserTypeListModel
    {
		public Int32 UserTypeId { get; set; }
		public String UserTypeName { get; set; }
    }


    public class UserTypePostModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 UserTypeId { get; set; }
    }


    public class UserTypePutModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 UserTypeId { get; set; }
    }



    public class UserTypeDeleteModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 UserTypeId { get; set; }
    }


}

