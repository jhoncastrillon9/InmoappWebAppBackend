namespace DataAccess.Banks
{
    using CodeMono.DataAccess.DBConnection;
    using DataAccess.Data;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="AccountsStatusModel" />.
    /// </summary>
    public class AccountsStatusModel: BaseModel<AccountsStatus>
    {
        public AccountsStatusModel(InmmoAppContext context) : base(context)
        {

        }

    }
}

