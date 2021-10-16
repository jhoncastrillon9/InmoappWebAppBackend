namespace DataAccess.Banks
{
    using DataAccess.Data;

    /// <summary>
    /// Defines the <see cref="AccountsStatusModel" />.
    /// </summary>
    public class AccountsStatusModel : BaseModel<AccountsStatus>
    {
        public AccountsStatusModel(InmmoAppContext context) : base(context)
        {

        }

    }
}

