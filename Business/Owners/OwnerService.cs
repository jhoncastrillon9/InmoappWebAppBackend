namespace Business.Owners
{
    using AutoMapper;
    using DataAccess;
    using DataAccess.Data;
    using DataAccess.Owners;
    using Microsoft.AspNetCore.Http;
    using Microsoft.Extensions.Configuration;

    /// <summary>
    /// Defines the <see cref="OwnerService" />.
    /// </summary>
    public class OwnerService : BaseService<Owner>
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ZoneService"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>
        public OwnerService(OwnerModel model, IMapper mapper, IHttpContextAccessor httpContext, BaseStoreProcedureModel spModel) : base(model, mapper, httpContext, spModel)
        {

        }

    }
}

