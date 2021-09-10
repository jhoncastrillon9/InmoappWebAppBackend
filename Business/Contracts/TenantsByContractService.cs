namespace Business.Contracts
{
    using DataAccess.Contracts;
    using global::Commons.DTOs.Contracts;
    using Microsoft.Extensions.Configuration;

    /// <summary>
    /// Defines the <see cref="TenantsByContractService" />.
    /// </summary>
    public class TenantsByContractService : BaseService<TenantsByContractDTO>
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ZoneService"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>
        public TenantsByContractService(TenantsByContractModel model) : base(model)
        {

        }

    }
}

