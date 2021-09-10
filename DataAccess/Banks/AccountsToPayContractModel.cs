namespace DataAccess.Banks
{
    using CodeMono.DataAccess.DBConnection;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="AccountsToPayContractModel" />.
    /// </summary>
    public class AccountsToPayContractModel: BaseModel
    {
        public AccountsToPayContractModel(DBConnectionMSSQL db) : base(db)
        {

        }

    }
}

