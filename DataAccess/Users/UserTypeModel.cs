using DataAccess.Data;
using System;
using System.Collections.Generic;
using System.Text;

namespace DataAccess.Users
{
    public class UserTypeModel : BaseModel<UserType>
    {
        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="context"></param>
        public UserTypeModel(InmmoAppContext context): base(context)
        {

        }
    }
}
