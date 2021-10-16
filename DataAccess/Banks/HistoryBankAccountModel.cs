namespace DataAccess.Banks
{
    using DataAccess.Data;

    /// <summary>
    /// Defines the <see cref="HistoryBankAccountModel" />.
    /// </summary>
    public class HistoryBankAccountModel : BaseModel<HistoryBankAccount>
    {
        public HistoryBankAccountModel(InmmoAppContext context) : base(context)
        {

        }

    }
}

