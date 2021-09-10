using Commons.DTOs.Properties;
using DataAccess.Properties;

namespace Business.Properties
{
    /// <summary>
    /// Defines the <see cref="PropertyStatusService" />.
    /// </summary>
    public class PropertyStatusService : BaseService<PropertyStatusDTO>
    {

        public PropertyStatusService(PropertyStatusModel model) : base(model)
        {

        }

    }
}

