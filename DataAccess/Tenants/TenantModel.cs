namespace DataAccess.Tenants
{
    using DataAccess.Data;

    /// <summary>
    /// Defines the <see cref="TenantModel" />.
    /// </summary>
    public class TenantModel : BaseModel<Tenant>
    {
        public TenantModel(InmmoAppContext context) : base(context)
        {

        }

    }
}

