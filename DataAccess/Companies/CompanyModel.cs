namespace DataAccess.Companies
{
    using CodeMono.DataAccess.DBConnection;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="CompanyModel" />.
    /// </summary>
    public class CompanyModel: BaseModel
    {
        public CompanyModel(DBConnectionMSSQL db) : base(db)
        {

        }


    }
}

