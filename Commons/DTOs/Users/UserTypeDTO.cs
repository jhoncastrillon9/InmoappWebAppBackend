using System;
using System.Collections.Generic;
using System.Text;

namespace Commons.DTOs.Users
{
    public class UserTypeDTO: ResponseSpDTO
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
}
