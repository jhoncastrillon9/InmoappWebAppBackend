namespace Business.Properties
{
    using DataAccess;
    using DataAccess.Data;
    using DataAccess.Properties;
    using global::Commons.DTOs.Properties;

    /// <summary>
    /// Defines the <see cref="PropertyCategoryService" />.
    /// </summary>
    public class PropertyCategoryService : BaseService<PropertyCategory>
    {
        public PropertyCategoryService(PropertyCategoryModel model, BaseStoreProcedureModel spModel) : base(model, spModel)
        {

        }

    }
}

