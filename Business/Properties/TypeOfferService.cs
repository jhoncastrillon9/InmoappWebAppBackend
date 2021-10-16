namespace Business.Properties
{
    using DataAccess;
    using DataAccess.Data;
    using DataAccess.Properties;

    /// <summary>
    /// Defines the <see cref="TypeOfferService" />.
    /// </summary>
    public class TypeOfferService : BaseService<TypeOffer>
    {
        public TypeOfferService(TypeOfferModel model, BaseStoreProcedureModel spModel) : base(model, spModel)
        {

        }

    }
}

