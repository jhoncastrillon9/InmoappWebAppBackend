namespace Business.Commons
{
    using DataAccess.Commons;
    using global::Commons.DTOs.Commons;

    /// <summary>
    /// Defines the <see cref="NeighborhoodService" />.
    /// </summary>
    public class NeighborhoodService : BaseService<NeighborhoodDTO>
    {

        public NeighborhoodService(ZoneModel model) : base(model)
        {

        }

    }
}

