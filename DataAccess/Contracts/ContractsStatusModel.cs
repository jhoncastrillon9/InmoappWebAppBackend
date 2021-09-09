namespace DataAccess.Contracts
{
    using CodeMono.DataAccess.DBConnection;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="ContractsStatusModel" />.
    /// </summary>
    public class ContractsStatusModel: BaseModel
    {
        public ContractsStatusModel(IConfiguration config, string con) : base(config, con)
        {

        }

    }
}

