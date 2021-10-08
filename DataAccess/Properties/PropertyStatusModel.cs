namespace DataAccess.Properties
{
    using CodeMono.DataAccess.DBConnection;
    using DataAccess.Data;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="PropertyStatusModel" />.
    /// </summary>
    public class PropertyStatusModel: BaseModel<PropertyStatus>
    {
        public PropertyStatusModel(InmmoAppContext context) : base(context)
        {

        }

    }
}

