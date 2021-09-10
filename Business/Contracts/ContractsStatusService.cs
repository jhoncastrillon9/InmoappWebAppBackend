namespace Business.Contracts
{
    using DataAccess.Contracts;
    using global::Commons.DTOs.Contracts;
    using Microsoft.Extensions.Configuration;

    /// <summary>
    /// Defines the <see cref="ContractsStatusService" />.
    /// </summary>
    public class ContractsStatusService : BaseService<ContractsStatusDTO>
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ZoneService"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>        
        public ContractsStatusService(ContractsStatusModel model) : base(model)
        {

        }

    }
}

