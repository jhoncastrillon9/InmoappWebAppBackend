namespace Business.Contracts
{
    using DataAccess;
    using DataAccess.Contracts;
    using Contract = DataAccess.Data.Contract;
    using Microsoft.Extensions.Configuration;
    using System.Diagnostics.Contracts;
  

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
        public ContractService(ContractModel model, BaseStoreProcedureModel spModel) : base(model, spModel)
        {

        }

    }
}

