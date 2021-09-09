namespace DataAccess.Contracts
{
    using CodeMono.DataAccess.DBConnection;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="ContractModel" />.
    /// </summary>
    public class ContractModel: BaseModel
    {
        public ContractModel(IConfiguration config, string con) : base(config, con)
        {

        }

    }
}

