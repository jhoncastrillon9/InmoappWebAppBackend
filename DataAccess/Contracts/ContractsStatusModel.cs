namespace DataAccess.Contracts
{
    using CodeMono.DataAccess.DBConnection;
    using DataAccess.Data;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="ContractsStatusModel" />.
    /// </summary>
    public class ContractsStatusModel: BaseModel<ContractsStatus>
    {
        public ContractsStatusModel(InmmoAppContext context) : base(context)
        {

        }

    }
}

