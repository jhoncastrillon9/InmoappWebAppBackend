using AutoMapper;
using DataAccess;
using DataAccess.Data;
using DataAccess.Users;

namespace Business.Users
{
    public class UserTypeService : BaseService<UserType>
    {
        /// <summary>
        /// constructor de la clase UserType
        /// </summary>
        /// <param name="model"></param>
        /// <param name="spModel"></param>
        public UserTypeService(UserTypeModel model, IMapper mapper, BaseStoreProcedureModel spModel) : base(model, mapper, spModel)
        {

        }
    }
}
