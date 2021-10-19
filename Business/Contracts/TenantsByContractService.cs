namespace Business.Contracts
{
    using AutoMapper;
    using DataAccess;
    using DataAccess.Contracts;
    using DataAccess.Data;
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
        public TenantsByContractService(TenantsByContractModel model, IMapper mapper, BaseStoreProcedureModel spModel) : base(model, mapper, spModel)
        {

        }

    }
}

