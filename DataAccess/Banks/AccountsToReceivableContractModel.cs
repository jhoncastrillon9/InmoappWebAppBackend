namespace DataAccess.Banks
{
    using CodeMono.DataAccess.DBConnection;
    using DataAccess.Data;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="AccountsToReceivableContractModel" />.
    /// </summary>
    public class AccountsToReceivableContractModel: BaseModel<AccountsToReceivableContract>
    {
        public AccountsToReceivableContractModel(InmmoAppContext context) : base(context)
        {

        }

    }
}

