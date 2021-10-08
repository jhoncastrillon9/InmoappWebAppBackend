namespace Business.Properties
{
    using DataAccess;
    using DataAccess.Data;
    using DataAccess.Properties;
    using global::Commons.DTOs.Properties;

    /// <summary>
    /// Defines the <see cref="PropertyService" />.
    /// </summary>
    public class PropertyService : BaseService<Property>
    {
        public PropertyService(PropertyModel model, BaseStoreProcedureModel spModel) : base(model, spModel)
        {

        }
    }
}

