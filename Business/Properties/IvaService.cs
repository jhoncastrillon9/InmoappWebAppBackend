namespace Business.Properties
{
    using DataAccess.Properties;
    using global::Commons.DTOs.Properties;

    /// <summary>
    /// Defines the <see cref="IvaService" />.
    /// </summary>
    public class IvaService : BaseService<IvaDTO>
    {

        public IvaService(IvaModel model) : base(model)
        {

        }

    }
}

