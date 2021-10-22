namespace Business.Properties
{
    using AutoMapper;
    using DataAccess;
    using DataAccess.Data;
    using DataAccess.Properties;
    using global::Commons.DTOs.Properties;
    using Microsoft.AspNetCore.Http;

    /// <summary>
    /// Defines the <see cref="PropertyService" />.
    /// </summary>
    public class PropertyService : BaseService<Property>
    {
        public PropertyService(PropertyModel model, IMapper mapper, IHttpContextAccessor httpContext, BaseStoreProcedureModel spModel) : base(model, mapper, httpContext, spModel)
        {

        }




    }
}

