namespace Business.Commons
{
    using DataAccess.Commons;
    using global::Commons.DTOs.Commons;

    /// <summary>
    /// Defines the <see cref="StateService" />.
    /// </summary>
    public class StateService : BaseService<StateDTO>
    {
        public StateService(ZoneModel model) : base(model)
        {

        }
    }
}

