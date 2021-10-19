namespace Business.Banks
{
    using AutoMapper;
    using DataAccess;
    using DataAccess.Banks;
    using DataAccess.Data;
    using Microsoft.Extensions.Configuration;

    /// <summary>
    /// Defines the <see cref="AccountsToPayContractService" />.
    /// </summary>
    public class AccountsToPayContractService : BaseService<AccountsToPayContract>
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ZoneService"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>
        public AccountsToPayContractService(AccountsToPayContractModel model, IMapper mapper, BaseStoreProcedureModel spModel) : base(model, mapper, spModel)
        {

        }

    }
}

