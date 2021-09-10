namespace DataAccess.Properties
{
    using CodeMono.DataAccess.DBConnection;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="ImagesModel" />.
    /// </summary>
    public class ImagesModel : BaseModel
    {
        public ImagesModel(DBConnectionMSSQL db) : base(db)
        {

        }
    }
}

