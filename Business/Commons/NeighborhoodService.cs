namespace Business.Commons
{
    using AutoMapper;
    using DataAccess;
    using DataAccess.Commons;
    using DataAccess.Data;
    using Microsoft.AspNetCore.Http;

    /// <summary>
    /// Defines the <see cref="NeighborhoodService" />.
    /// </summary>
    public class NeighborhoodService : BaseService<Neighborhood>
    {

        public NeighborhoodService(NeighborhoodModel model, IMapper mapper, IHttpContextAccessor httpContext, BaseStoreProcedureModel spModel) : base(model, mapper, httpContext, spModel)
        {

        }

    }
}

