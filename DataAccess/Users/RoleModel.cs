using DataAccess.Data;
using System;
using System.Collections.Generic;
using System.Text;

namespace DataAccess.Users
{
    public class RoleModel : BaseModel<Role>
    {

        public RoleModel(InmmoAppContext context) :base(context)
        {

        }
    }
}
