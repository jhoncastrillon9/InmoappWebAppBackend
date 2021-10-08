using Commons.DTOs.Properties;
using DataAccess;
using DataAccess.Data;
using DataAccess.Properties;

namespace Business.Properties
{
    /// <summary>
    /// Defines the <see cref="PropertyStatusService" />.
    /// </summary>
    public class PropertyStatusService : BaseService<PropertyStatus>
    {

        public PropertyStatusService(PropertyStatusModel model, BaseStoreProcedureModel spModel) : base(model, spModel)
        {

        }

    }
}

