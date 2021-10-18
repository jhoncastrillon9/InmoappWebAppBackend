using DataAccess.Data;
using DataAccess.Users;

namespace Business.Users
{
    public class UserByRoleService : BaseService<UserByRole>
    {

        public UserByRoleService(UserByRoleModel model) : base(model)
        {

        }
    }
}
