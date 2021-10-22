using AutoMapper;
using DataAccess;
using DataAccess.Data;
using DataAccess.Users;
using Microsoft.AspNetCore.Http;

namespace Business.Users
{
    public class UserService : BaseService<User>
    {
        /// <summary>
        /// Constructor de la clase de usuarios
        /// </summary>
        /// <param name="model"></param>
        /// <param name="spModel"></param>
        public UserService(UserModel model, IMapper mapper, IHttpContextAccessor httpContext, BaseStoreProcedureModel spModel) : base(model, mapper, httpContext, spModel)
        {

        }
    }
}
