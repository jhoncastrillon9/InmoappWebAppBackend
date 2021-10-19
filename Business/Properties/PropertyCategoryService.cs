namespace Business.Properties
{
    using AutoMapper;
    using DataAccess;
    using DataAccess.Data;
    using DataAccess.Properties;

    /// <summary>
    /// Defines the <see cref="PropertyCategoryService" />.
    /// </summary>
    public class PropertyCategoryService : BaseService<PropertyCategory>
    {
        public PropertyCategoryService(PropertyCategoryModel model, IMapper mapper, BaseStoreProcedureModel spModel) : base(model, mapper, spModel)
        {

        }

    }
}

