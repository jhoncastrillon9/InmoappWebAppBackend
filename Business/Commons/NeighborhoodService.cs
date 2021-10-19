namespace Business.Commons
{
    using AutoMapper;
    using DataAccess;
    using DataAccess.Commons;
    using DataAccess.Data;

    /// <summary>
    /// Defines the <see cref="NeighborhoodService" />.
    /// </summary>
    public class NeighborhoodService : BaseService<Neighborhood>
    {

        public NeighborhoodService(NeighborhoodModel model, IMapper mapper, BaseStoreProcedureModel spModel) : base(model, mapper, spModel)
        {

        }

    }
}

