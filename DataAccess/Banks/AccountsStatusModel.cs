namespace DataAccess.Banks
{
    using CodeMono.DataAccess.DBConnection;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="AccountsStatusModel" />.
    /// </summary>
    public class AccountsStatusModel: BaseModel
    {
        public AccountsStatusModel(IConfiguration config, string con) : base(config, con)
        {

        }

    }
}

