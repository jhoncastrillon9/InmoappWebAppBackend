using AutoMapper;
using DataAccess.Data;
using DataAccess.Users;

namespace Business.Users
{
    public class RoleService : BaseService<Role>
    {
        public RoleService(RoleModel model, IMapper mapper) : base(model, mapper)
        {

        }


    }
}
