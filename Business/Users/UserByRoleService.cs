using AutoMapper;
using DataAccess.Data;
using DataAccess.Users;
using Microsoft.AspNetCore.Http;

namespace Business.Users
{
    public class UserByRoleService : BaseService<UserByRole>
    {

        public UserByRoleService(UserByRoleModel model, IMapper mapper,IHttpContextAccessor httpContext) : base(model, mapper, httpContext)
        {

        }
    }
}
