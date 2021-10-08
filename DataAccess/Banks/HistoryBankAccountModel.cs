namespace DataAccess.Banks
{
    using CodeMono.DataAccess.DBConnection;
    using DataAccess.Data;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="HistoryBankAccountModel" />.
    /// </summary>
    public class HistoryBankAccountModel: BaseModel<HistoryBankAccount>
    {
        public HistoryBankAccountModel(InmmoAppContext context) : base(context)
        {

        }

    }
}

