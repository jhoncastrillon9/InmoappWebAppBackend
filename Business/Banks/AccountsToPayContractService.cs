namespace Business.Banks
{
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
        public AccountsToPayContractService(AccountsToPayContractModel model, BaseStoreProcedureModel spModel) : base(model, spModel)
        {

        }

    }
}

