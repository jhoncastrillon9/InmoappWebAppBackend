using System;
using System.Collections.Generic;

namespace DataAccess.Data
{
    public partial class Role
    {
        public Role()
        {
            UserByRole = new HashSet<UserByRole>();
        }

        public int RoleId { get; set; }
        public string Name { get; set; }

        public ICollection<UserByRole> UserByRole { get; set; }
    }
}
