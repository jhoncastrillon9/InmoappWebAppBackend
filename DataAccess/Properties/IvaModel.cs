namespace DataAccess.Properties
{
    using CodeMono.DataAccess.DBConnection;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="IvaModel" />.
    /// </summary>
    public class IvaModel: BaseModel
    {
        public IvaModel(IConfiguration config, string con) : base(config, con)
        {

        }
    }
}

