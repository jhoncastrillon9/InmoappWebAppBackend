namespace Business.Tenants
{
    using DataAccess;
    using DataAccess.Data;
    using DataAccess.Tenants;
    using global::Commons.DTOs.Tenants;
    using Microsoft.Extensions.Configuration;

    /// <summary>
    /// Defines the <see cref="TenantService" />.
    /// </summary>
    public class TenantService : BaseService<Tenant>
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ZoneService"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>        
        public TenantService(TenantModel model, BaseStoreProcedureModel spModel) : base(model, spModel)
        {

        }

    }
}

