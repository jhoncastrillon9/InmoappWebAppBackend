namespace DataAccess.Commons
{
    using Microsoft.Extensions.Configuration;

    /// <summary>
    /// Defines the <see cref="NeighborhoodModel" />.
    /// </summary>
    public class NeighborhoodModel : BaseModel
    {
        public NeighborhoodModel(IConfiguration config, string con) : base(config, con)
        {

        }

    }
}

