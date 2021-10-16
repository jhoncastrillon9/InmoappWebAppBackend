namespace DataAccess.Contracts
{
    using DataAccess.Data;

    /// <summary>
    /// Defines the <see cref="ContractModel" />.
    /// </summary>
    public class ContractModel : BaseModel<Contract>
    {
        public ContractModel(InmmoAppContext context) : base(context)
        {

        }

    }
}

