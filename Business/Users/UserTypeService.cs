using AutoMapper;
using DataAccess;
using DataAccess.Data;
using DataAccess.Users;
using Microsoft.AspNetCore.Http;

namespace Business.Users
{
    public class UserTypeService : BaseService<UserType>
    {
        /// <summary>
        /// constructor de la clase UserType
        /// </summary>
        /// <param name="model"></param>
        /// <param name="spModel"></param>
        public UserTypeService(UserTypeModel model, IMapper mapper, IHttpContextAccessor httpContext, BaseStoreProcedureModel spModel) : base(model, mapper, httpContext, spModel)
        {

        }
    }
}
