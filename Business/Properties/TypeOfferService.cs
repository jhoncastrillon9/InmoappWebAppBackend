namespace Business.Properties
{
    using AutoMapper;
    using DataAccess;
    using DataAccess.Data;
    using DataAccess.Properties;

    /// <summary>
    /// Defines the <see cref="TypeOfferService" />.
    /// </summary>
    public class TypeOfferService : BaseService<TypeOffer>
    {
        public TypeOfferService(TypeOfferModel model, IMapper mapper, BaseStoreProcedureModel spModel) : base(model, mapper, spModel)
        {

        }

    }
}

