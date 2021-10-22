namespace Business.Properties
{
    using AutoMapper;
    using DataAccess;
    using DataAccess.Data;
    using DataAccess.Properties;
    using Microsoft.AspNetCore.Http;

    /// <summary>
    /// Defines the <see cref="IvaService" />.
    /// </summary>
    public class IvaService : BaseService<Iva>
    {

        public IvaService(IvaModel model, IMapper mapper, IHttpContextAccessor httpContext, BaseStoreProcedureModel spModel) : base(model, mapper, httpContext, spModel)
        {

        }

    }
}

