namespace Business.Properties
{
    using DataAccess.Properties;
    using global::Commons.DTOs.Properties;

    /// <summary>
    /// Defines the <see cref="PropertyCategoryService" />.
    /// </summary>
    public class PropertyCategoryService : BaseService<PropertyCategoryDTO>
    {
        public PropertyCategoryService(PropertyCategoryModel model) : base(model)
        {

        }

    }
}

