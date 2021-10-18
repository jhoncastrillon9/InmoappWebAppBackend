using DataAccess;
using DataAccess.Data;
using DataAccess.Users;

namespace Business.Users
{
    public class UserService : BaseService<User>
    {
        /// <summary>
        /// Constructor de la clase de usuarios
        /// </summary>
        /// <param name="model"></param>
        /// <param name="spModel"></param>
        public UserService(UserModel model, BaseStoreProcedureModel spModel) : base(model, spModel)
        {

        }
    }
}
