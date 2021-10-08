namespace DataAccess.Banks
{
    using CodeMono.DataAccess.DBConnection;
    using DataAccess.Data;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="BankAccountModel" />.
    /// </summary>
    public class BankAccountModel: BaseModel<BankAccount>
    {
        public BankAccountModel(InmmoAppContext context) : base(context)
        {

        }

    }
}

