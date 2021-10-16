namespace DataAccess.Contracts
{
    using DataAccess.Data;

    /// <summary>
    /// Defines the <see cref="TenantsByContractModel" />.
    /// </summary>
    public class TenantsByContractModel : BaseModel<TenantsByContract>
    {
        public TenantsByContractModel(InmmoAppContext context) : base(context)
        {

        }

    }
}

