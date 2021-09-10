namespace Business.Properties
{
    using DataAccess.Properties;
    using global::Commons.DTOs.Properties;

    /// <summary>
    /// Defines the <see cref="PropertyService" />.
    /// </summary>
    public class PropertyService : BaseService<PropertyDTO>
    {
        public PropertyService(PropertyModel model) : base(model)
        {

        }
    }
}

