using Microsoft.Extensions.Configuration;
using DataAccess.Properties;
using Commons.DTOs.Properties;

namespace Business.Properties
{
    /// <summary>
    /// Defines the <see cref="PropertyStatusService" />.
    /// </summary>
    public class PropertyStatusService: BaseService<PropertyStatusDTO>
    {
        public PropertyStatusService(IConfiguration config, string con) : base(new PropertyStatusModel(config, con))
        {

        }

    }
}

