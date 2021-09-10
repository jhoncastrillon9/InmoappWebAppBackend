namespace DataAccess.Contracts
{
    using CodeMono.DataAccess.DBConnection;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="TenantsByContractModel" />.
    /// </summary>
    public class TenantsByContractModel: BaseModel
    {
        public TenantsByContractModel(DBConnectionMSSQL db) : base(db)
        {

        }

    }
}

