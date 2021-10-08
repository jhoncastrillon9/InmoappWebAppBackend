namespace Business.Contracts
{
    using DataAccess;
    using DataAccess.Contracts;
    using DataAccess.Data;
    using global::Commons.DTOs.Contracts;
    using Microsoft.Extensions.Configuration;

    /// <summary>
    /// Defines the <see cref="TenantsByContractService" />.
    /// </summary>
    public class TenantsByContractService : BaseService<TenantsByContract>
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ZoneService"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>
        public TenantsByContractService(TenantsByContractModel model, BaseStoreProcedureModel spModel) : base(model, spModel)
        {

        }

    }
}

