namespace DataAccess.Properties
{
    using CodeMono.DataAccess.DBConnection;
    using DataAccess.Data;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="PropertyCategoryModel" />.
    /// </summary>
    public class PropertyCategoryModel: BaseModel<PropertyCategory>
    {
        public PropertyCategoryModel(InmmoAppContext context) : base(context)
        {

        }
    }
}

