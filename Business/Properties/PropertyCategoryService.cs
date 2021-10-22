namespace Business.Properties
{
    using AutoMapper;
    using DataAccess;
    using DataAccess.Data;
    using DataAccess.Properties;
    using Microsoft.AspNetCore.Http;

    /// <summary>
    /// Defines the <see cref="PropertyCategoryService" />.
    /// </summary>
    public class PropertyCategoryService : BaseService<PropertyCategory>
    {
        public PropertyCategoryService(PropertyCategoryModel model, IMapper mapper, IHttpContextAccessor httpContext, BaseStoreProcedureModel spModel) : base(model, mapper, httpContext, spModel)
        {

        }

    }
}

