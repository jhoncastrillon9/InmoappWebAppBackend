namespace DataAccess.Contracts
{
    using DataAccess.Data;

    /// <summary>
    /// Defines the <see cref="ContractsStatusModel" />.
    /// </summary>
    public class ContractsStatusModel : BaseModel<ContractsStatus>
    {
        public ContractsStatusModel(InmmoAppContext context) : base(context)
        {

        }

    }
}

