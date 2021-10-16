namespace DataAccess.Banks
{
    using DataAccess.Data;

    /// <summary>
    /// Defines the <see cref="AccountsToPayContractModel" />.
    /// </summary>
    public class AccountsToPayContractModel : BaseModel<AccountsToPayContract>
    {
        public AccountsToPayContractModel(InmmoAppContext context) : base(context)
        {

        }

    }
}

