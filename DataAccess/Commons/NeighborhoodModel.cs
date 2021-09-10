namespace DataAccess.Commons
{
    using CodeMono.DataAccess.DBConnection;
    using Microsoft.Extensions.Configuration;

    /// <summary>
    /// Defines the <see cref="NeighborhoodModel" />.
    /// </summary>
    public class NeighborhoodModel : BaseModel
    {
        public NeighborhoodModel(DBConnectionMSSQL db) : base(db)
        {

        }

    }
}

