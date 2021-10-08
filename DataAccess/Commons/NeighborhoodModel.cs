namespace DataAccess.Commons
{
    using CodeMono.DataAccess.DBConnection;
    using DataAccess.Data;
    using Microsoft.Extensions.Configuration;

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

