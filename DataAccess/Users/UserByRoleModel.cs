using DataAccess.Data;
using System;
using System.Collections.Generic;
using System.Text;

namespace DataAccess.Users
{
    public class UserByRoleModel:BaseModel<UserByRole>
    { 
        public UserByRoleModel(InmmoAppContext context) : base(context)
        {

        }
    }
}
