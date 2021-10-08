namespace DataAccess.Banks
{
    using CodeMono.DataAccess.DBConnection;
    using DataAccess.Data;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="AccountsToPayContractModel" />.
    /// </summary>
    public class AccountsToPayContractModel: BaseModel<AccountsToPayContract>
    {
        public AccountsToPayContractModel(InmmoAppContext context) : base(context)
        {

        }

    }
}

