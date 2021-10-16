namespace Business.Banks
{
    using DataAccess;
    using DataAccess.Banks;
    using DataAccess.Data;
    using Microsoft.Extensions.Configuration;

    /// <summary>
    /// Defines the <see cref="BankAccountService" />.
    /// </summary>
    public class BankAccountService : BaseService<BankAccount>
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ZoneService"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>
        public BankAccountService(BankAccountModel model, BaseStoreProcedureModel spModel) : base(model, spModel)
        {

        }

    }
}

