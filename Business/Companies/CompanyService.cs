namespace Business.Companies
{
    using AutoMapper;
    using DataAccess;
    using DataAccess.Companies;
    using DataAccess.Data;
    using Microsoft.AspNetCore.Http;

    /// <summary>
    /// Defines the <see cref="CompanyService" />.
    /// </summary>
    public class CompanyService : BaseService<Company>
    {
        public CompanyService(CompanyModel model, IMapper mapper, IHttpContextAccessor httpContext, BaseStoreProcedureModel spModel) : base(model, mapper, httpContext, spModel)
        {

        }
    }
}

