using AutoMapper;
using DataAccess.Data;
using DataAccess.Users;
using Microsoft.AspNetCore.Http;

namespace Business.Users
{
    public class RoleService : BaseService<Role>
    {
        public RoleService(RoleModel model, IMapper mapper,IHttpContextAccessor httpContext) : base(model, mapper, httpContext)
        {

        }


    }
}
