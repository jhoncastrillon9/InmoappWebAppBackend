namespace Business.Banks
{
    using DataAccess.Banks;
    using global::Commons.DTOs.Banks;
    using Microsoft.Extensions.Configuration;

    /// <summary>
    /// Defines the <see cref="AccountsToReceivableContractService" />.
    /// </summary>
    public class AccountsToReceivableContractService : BaseService<AccountsToReceivableContractDTO>
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ZoneService"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>
        public AccountsToReceivableContractService(AccountsToReceivableContractModel model) : base(model)
        {

        }

    }
}

