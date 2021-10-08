using System;
using System.Collections.Generic;

namespace DataAccess.Data
{
    public partial class User
    {
        public int UserId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public short UserTypeId { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Avatar { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedAt { get; set; }
        public int? UpdatedBy { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public int? DisabledBy { get; set; }
        public DateTime? DisabledAt { get; set; }
        public bool? Active { get; set; }

        public UserType UserType { get; set; }
    }
}
