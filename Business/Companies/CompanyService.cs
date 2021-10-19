namespace Business.Companies
{
    using AutoMapper;
    using DataAccess;
    using DataAccess.Companies;
    using DataAccess.Data;

    /// <summary>
    /// Defines the <see cref="CompanyService" />.
    /// </summary>
    public class CompanyService : BaseService<Company>
    {
        public CompanyService(CompanyModel model, IMapper mapper, BaseStoreProcedureModel spModel) : base(model, mapper, spModel)
        {

        }
    }
}

