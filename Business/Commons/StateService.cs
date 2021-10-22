namespace Business.Commons
{
    using AutoMapper;
    using DataAccess;
    using DataAccess.Commons;
    using DataAccess.Data;
    using Microsoft.AspNetCore.Http;

    /// <summary>
    /// Defines the <see cref="StateService" />.
    /// </summary>
    public class StateService : BaseService<State>
    {
        public StateService(StateModel model, IMapper mapper, IHttpContextAccessor httpContext, BaseStoreProcedureModel spModel) : base(model, mapper, httpContext, spModel)
        {

        }
    }
}

