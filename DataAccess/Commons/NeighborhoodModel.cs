namespace DataAccess.Commons
{
    using DataAccess.Data;

    /// <summary>
    /// Defines the <see cref="NeighborhoodModel" />.
    /// </summary>
    public class NeighborhoodModel : BaseModel<Neighborhood>
    {
        public NeighborhoodModel(InmmoAppContext context) : base(context)
        {

        }

    }
}

