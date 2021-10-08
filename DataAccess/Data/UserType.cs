using System;
using System.Collections.Generic;

namespace DataAccess.Data
{
    public partial class UserType
    {
        public UserType()
        {
            User = new HashSet<User>();
        }

        public short UserTypeId { get; set; }
        public string UserTypeName { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedAt { get; set; }
        public int? UpdatedBy { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public int? DisabledBy { get; set; }
        public DateTime? DisabledAt { get; set; }
        public bool? Active { get; set; }

        public ICollection<User> User { get; set; }
    }
}
