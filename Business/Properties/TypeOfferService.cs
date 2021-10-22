namespace Business.Properties
{
    using AutoMapper;
    using DataAccess;
    using DataAccess.Data;
    using DataAccess.Properties;
    using Microsoft.AspNetCore.Http;

    /// <summary>
    /// Defines the <see cref="TypeOfferService" />.
    /// </summary>
    public class TypeOfferService : BaseService<TypeOffer>
    {
        public TypeOfferService(TypeOfferModel model, IMapper mapper, IHttpContextAccessor httpContext, BaseStoreProcedureModel spModel) : base(model, mapper, httpContext, spModel)
        {

        }

    }
}

