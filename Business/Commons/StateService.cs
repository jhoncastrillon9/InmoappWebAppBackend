namespace Business.Commons
{
    using DataAccess;
    using DataAccess.Commons;
    using DataAccess.Data;
    using global::Commons.DTOs.Commons;

    /// <summary>
    /// Defines the <see cref="StateService" />.
    /// </summary>
    public class StateService : BaseService<State>
    {
        public StateService(StateModel model, BaseStoreProcedureModel spModel) : base(model, spModel)
        {

        }
    }
}

