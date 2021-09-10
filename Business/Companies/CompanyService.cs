namespace Business.Companies
{
    using DataAccess.Companies;
    using global::Commons.DTOs.Companies;

    /// <summary>
    /// Defines the <see cref="CompanyService" />.
    /// </summary>
    public class CompanyService : BaseService<CompanyDTO>
    {
        public CompanyService(CompanyModel model) : base(model)
        {

        }
    }
}

