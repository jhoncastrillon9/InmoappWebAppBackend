namespace Business.Properties
{
    using DataAccess;
    using DataAccess.Data;
    using DataAccess.Properties;
    using global::Commons.DTOs.Properties;

    /// <summary>
    /// Defines the <see cref="IvaService" />.
    /// </summary>
    public class IvaService : BaseService<Iva>
    {

        public IvaService(IvaModel model, BaseStoreProcedureModel spModel) : base(model, spModel)
        {

        }

    }
}

