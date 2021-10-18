using System;
using System.Collections.Generic;

namespace DataAccess.Data
{
    public partial class UserByRole
    {
        public int UserByRoleId { get; set; }
        public int UserId { get; set; }
        public int RoleId { get; set; }

        public Role Role { get; set; }
        public User User { get; set; }
    }
}
