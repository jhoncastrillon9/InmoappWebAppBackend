using AutoMapper;
using DataAccess;
using DataAccess.Data;
using DataAccess.Properties;
using Microsoft.AspNetCore.Http;

namespace Business.Properties
{
    /// <summary>
    /// Defines the <see cref="PropertyStatusService" />.
    /// </summary>
    public class PropertyStatusService : BaseService<PropertyStatus>
    {

        public PropertyStatusService(PropertyStatusModel model, IMapper mapper, IHttpContextAccessor httpContext, BaseStoreProcedureModel spModel) : base(model, mapper, httpContext, spModel)
        {

        }

    }
}

