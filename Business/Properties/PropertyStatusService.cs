using AutoMapper;
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

        public PropertyStatusService(PropertyStatusModel model, IMapper mapper, BaseStoreProcedureModel spModel) : base(model, mapper, spModel)
        {

        }

    }
}

