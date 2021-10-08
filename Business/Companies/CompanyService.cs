namespace Business.Companies
{
    using DataAccess;
    using DataAccess.Companies;
    using DataAccess.Data;
    using global::Commons.DTOs.Companies;

    /// <summary>
    /// Defines the <see cref="CompanyService" />.
    /// </summary>
    public class CompanyService : BaseService<Company>
    {
        public CompanyService(CompanyModel model, BaseStoreProcedureModel spModel) : base(model, spModel)
        {

        }
    }
}

