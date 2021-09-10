using CodeMono.DataAccess.DBConnection;
using Microsoft.Extensions.Configuration;

namespace DataAccess.Commons
{
    /// <summary>
    /// Defines the <see cref="StateModel" />.
    /// </summary>
    public class StateModel : BaseModel
    {
        public StateModel(DBConnectionMSSQL db) : base(db)
        {

        }

    }
}

