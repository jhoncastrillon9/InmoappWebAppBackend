namespace DataAccess.Properties
{
    using CodeMono.DataAccess.DBConnection;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="PropertyStatusModel" />.
    /// </summary>
    public class PropertyStatusModel: BaseModel
    {
        public PropertyStatusModel(DBConnectionMSSQL db) : base(db)
        {

        }

    }
}

