namespace Business.Banks
{
    using AutoMapper;
    using DataAccess;
    using DataAccess.Banks;
    using DataAccess.Data;
    using Microsoft.Extensions.Configuration;

    /// <summary>
    /// Defines the <see cref="AccountsStatusService" />.
    /// </summary>
    public class AccountsStatusService : BaseService<AccountsStatus>
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ZoneService"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>
        public AccountsStatusService(AccountsStatusModel model, IMapper mapper, BaseStoreProcedureModel spModel) : base(model, mapper, spModel)
        {

        }
    }
}

