namespace DataAccess.Banks
{
    using DataAccess.Data;

    /// <summary>
    /// Defines the <see cref="AccountsToReceivableContractModel" />.
    /// </summary>
    public class AccountsToReceivableContractModel : BaseModel<AccountsToReceivableContract>
    {
        public AccountsToReceivableContractModel(InmmoAppContext context) : base(context)
        {

        }

    }
}

