namespace DataAccess.Contracts
{
    using CodeMono.DataAccess.DBConnection;
    using DataAccess.Data;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="ContractModel" />.
    /// </summary>
    public class ContractModel: BaseModel<Contract>
    {
        public ContractModel(InmmoAppContext context) : base(context)
        {

        }

    }
}

