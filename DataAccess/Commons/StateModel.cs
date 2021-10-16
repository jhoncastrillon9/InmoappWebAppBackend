using DataAccess.Data;

namespace DataAccess.Commons
{
    /// <summary>
    /// Defines the <see cref="StateModel" />.
    /// </summary>
    public class StateModel : BaseModel<State>
    {
        public StateModel(InmmoAppContext context) : base(context)
        {

        }

    }
}

