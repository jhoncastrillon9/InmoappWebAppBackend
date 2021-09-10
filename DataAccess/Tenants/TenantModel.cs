namespace DataAccess.Tenants
{
    using CodeMono.DataAccess.DBConnection;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="TenantModel" />.
    /// </summary>
    public class TenantModel: BaseModel
    {
        public TenantModel(DBConnectionMSSQL db) : base(db)
        {

        }

    }
}

