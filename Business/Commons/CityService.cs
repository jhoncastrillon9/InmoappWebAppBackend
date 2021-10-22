namespace Business.Commons
{
    using AutoMapper;
    using DataAccess;
    using DataAccess.Commons;
    using DataAccess.Data;
    using Microsoft.AspNetCore.Http;

    /// <summary>
    /// Defines the <see cref="CityService" />.
    /// </summary>
    public class CityService : BaseService<City>
    {
        public CityService(CityModel model, IMapper mapper, IHttpContextAccessor httpContext, BaseStoreProcedureModel spModel) : base(model, mapper, httpContext, spModel)
        {

        }
    }
}

