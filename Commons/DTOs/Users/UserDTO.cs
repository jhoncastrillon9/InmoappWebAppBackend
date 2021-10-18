using System;
using System.Collections.Generic;
using System.Text;

namespace Commons.DTOs.Users
{
    public class UserDTO: ResponseSpDTO
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
}
