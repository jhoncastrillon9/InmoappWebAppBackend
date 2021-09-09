namespace DataAccess.Banks
{
    using CodeMono.DataAccess.DBConnection;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="HistoryBankAccountModel" />.
    /// </summary>
    public class HistoryBankAccountModel: BaseModel
    {
        public HistoryBankAccountModel(IConfiguration config, string con) : base(config, con)
        {

        }

    }
}

