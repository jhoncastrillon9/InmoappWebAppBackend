namespace Business.Commons
{
    using DataAccess;
    using DataAccess.Commons;
    using DataAccess.Data;
    using global::Commons.DTOs.Commons;

    /// <summary>
    /// Defines the <see cref="NeighborhoodService" />.
    /// </summary>
    public class NeighborhoodService : BaseService<Neighborhood>
    {

        public NeighborhoodService(NeighborhoodModel model, BaseStoreProcedureModel spModel) : base(model, spModel)
        {

        }

    }
}

