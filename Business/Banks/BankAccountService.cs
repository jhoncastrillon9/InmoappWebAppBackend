namespace Business.Banks
{
    using AutoMapper;
    using DataAccess;
    using DataAccess.Banks;
    using DataAccess.Data;
    using Microsoft.AspNetCore.Http;
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
        public BankAccountService(BankAccountModel model, IMapper mapper, IHttpContextAccessor httpContext, BaseStoreProcedureModel spModel) : base(model, mapper, httpContext, spModel)
        {

        }

    }
}

