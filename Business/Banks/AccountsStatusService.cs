namespace Business.Banks
{
    using AutoMapper;
    using DataAccess;
    using DataAccess.Banks;
    using DataAccess.Data;
    using Microsoft.AspNetCore.Http;
    using Microsoft.Extensions.Configuration;
    using System.Security.Claims;

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
        public AccountsStatusService(AccountsStatusModel model, IMapper mapper, BaseStoreProcedureModel spModel, IHttpContextAccessor httpContext) : base(model, mapper, httpContext, spModel)
        {
            
        }

        public void LoadUserSessionservice()
        {
            ClaimsIdentity identity = _HttpContext.HttpContext.User.Identity as ClaimsIdentity;
            if (identity != null)
            {
                var userIdSession = int.Parse(identity.FindFirst("userId").Value);
                var panyIdSession = int.Parse(identity.FindFirst("companyId").Value);
            }
        }

    }
}

