namespace DataAccess.Properties
{
    using CodeMono.DataAccess.DBConnection;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="PropertyCategoryModel" />.
    /// </summary>
    public class PropertyCategoryModel: BaseModel
    {
        public PropertyCategoryModel(IConfiguration config, string con) : base(config, con)
        {

        }
    }
}

