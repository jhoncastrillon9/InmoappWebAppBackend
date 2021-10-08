namespace Business.Contracts
{
    using DataAccess;
    using DataAccess.Contracts;
    using DataAccess.Data;
    using global::Commons.DTOs.Contracts;
    using Microsoft.Extensions.Configuration;

    /// <summary>
    /// Defines the <see cref="ContractsStatusService" />.
    /// </summary>
    public class ContractsStatusService : BaseService<ContractsStatus>
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ZoneService"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>        
        public ContractsStatusService(ContractsStatusModel model, BaseStoreProcedureModel spModel) : base(model, spModel)
        {

        }

    }
}

