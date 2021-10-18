using DataAccess.Data;

namespace DataAccess.Users
{
    public class UserModel : BaseModel<User>
    {
        public UserModel(InmmoAppContext context) : base(context)
        {
        }

    }
}
