namespace DataAccess.Properties
{
    using CodeMono.DataAccess.DBConnection;
    using DataAccess.Data;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="PropertyModel" />.
    /// </summary>
    public class PropertyModel: BaseModel<Property>
    {
        public PropertyModel(InmmoAppContext context) : base(context)
        {

        }

    }
}

