namespace DataAccess.Banks
{
    using CodeMono.DataAccess.DBConnection;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="AccountsToReceivableContractModel" />.
    /// </summary>
    public class AccountsToReceivableContractModel: BaseModel
    {
        public AccountsToReceivableContractModel(DBConnectionMSSQL db) : base(db)
        {

        }

    }
}

