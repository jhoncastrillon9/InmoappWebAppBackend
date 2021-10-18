using DataAccess;
using DataAccess.Data;
using DataAccess.Users;
using System;
using System.Collections.Generic;
using System.Text;

namespace Business.Users
{
    public class UserTypeService : BaseService<UserType>
    {
        /// <summary>
        /// constructor de la clase UserType
        /// </summary>
        /// <param name="model"></param>
        /// <param name="spModel"></param>
        public UserTypeService(UserTypeModel model, BaseStoreProcedureModel spModel) : base(model, spModel)
        {

        }
    }
}
