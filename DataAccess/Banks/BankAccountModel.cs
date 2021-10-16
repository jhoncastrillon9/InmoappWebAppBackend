namespace DataAccess.Banks
{
    using DataAccess.Data;

    /// <summary>
    /// Defines the <see cref="BankAccountModel" />.
    /// </summary>
    public class BankAccountModel : BaseModel<BankAccount>
    {
        public BankAccountModel(InmmoAppContext context) : base(context)
        {

        }

    }
}

