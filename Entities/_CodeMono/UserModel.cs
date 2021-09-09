using System;

namespace CodeMono.Entities
{
    public class UserModel
    {
		public Int32 UserId { get; set; }
		public String FirstName { get; set; }
		public String LastName { get; set; }
		public Int16 UserTypeId { get; set; }
		public String UserTypeName { get; set; }
		public String Username { get; set; }
		public String Password { get; set; }
		public String Avatar { get; set; }
		public Int32 CreatedBy { get; set; }
		public DateTime CreatedAt { get; set; }
		public Int32 UpdatedBy { get; set; }
		public DateTime UpdatedAt { get; set; }
		public Int32 DisabledBy { get; set; }
		public DateTime DisabledAt { get; set; }
		public Boolean Active { get; set; }

    }


    public class UserListModel
    {
		public Int32 UserId { get; set; }
		public String UserName { get; set; }

    }


    public class UserPostModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 UserId { get; set; }

    }


    public class UserPutModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 UserId { get; set; }

    }



    public class UserDeleteModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 UserId { get; set; }

    }


}

