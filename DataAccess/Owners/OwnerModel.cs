namespace DataAccess.Owners
{
    using CodeMono.DataAccess.DBConnection;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="OwnerModel" />.
    /// </summary>
    public class OwnerModel: BaseModel
    {
        public OwnerModel(IConfiguration config, string con) : base(config, con)
        {

        }
    }
}

