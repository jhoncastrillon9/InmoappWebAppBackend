namespace DataAccess.Companies
{
    using DataAccess.Data;

    /// <summary>
    /// Defines the <see cref="CompanyModel" />.
    /// </summary>
    public class CompanyModel : BaseModel<Company>
    {
        public CompanyModel(InmmoAppContext context) : base(context)
        {

        }


    }
}

