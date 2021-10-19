namespace Business.Commons
{
    using AutoMapper;
    using DataAccess;
    using DataAccess.Commons;
    using DataAccess.Data;

    /// <summary>
    /// Defines the <see cref="StateService" />.
    /// </summary>
    public class StateService : BaseService<State>
    {
        public StateService(StateModel model, IMapper mapper, BaseStoreProcedureModel spModel) : base(model, mapper, spModel)
        {

        }
    }
}

