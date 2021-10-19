namespace Business.Contracts
{
    using AutoMapper;
    using DataAccess;
    using DataAccess.Contracts;
    using Microsoft.Extensions.Configuration;
    using Contract = DataAccess.Data.Contract;


    /// <summary>
    /// Defines the <see cref="ContractService" />.
    /// </summary>
    public class ContractService : BaseService<Contract>
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ContractService"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>        
        public ContractService(ContractModel model, IMapper mapper, BaseStoreProcedureModel spModel) : base(model, mapper, spModel)
        {

        }

    }
}

