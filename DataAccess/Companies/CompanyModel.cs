namespace DataAccess.Companies
{
    using CodeMono.DataAccess.DBConnection;
    using DataAccess.Data;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="CompanyModel" />.
    /// </summary>
    public class CompanyModel: BaseModel<Company>
    {
        public CompanyModel(InmmoAppContext context) : base(context)
        {

        }


    }
}

