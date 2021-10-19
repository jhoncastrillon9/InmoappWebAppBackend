namespace Business.Properties
{
    using AutoMapper;
    using DataAccess;
    using DataAccess.Data;
    using DataAccess.Properties;

    /// <summary>
    /// Defines the <see cref="IvaService" />.
    /// </summary>
    public class IvaService : BaseService<Iva>
    {

        public IvaService(IvaModel model, IMapper mapper, BaseStoreProcedureModel spModel) : base(model, mapper, spModel)
        {

        }

    }
}

