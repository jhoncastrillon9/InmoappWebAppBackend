namespace DataAccess.Commons
{
    using CodeMono.DataAccess.DBConnection;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="CityModel" />.
    /// </summary>
    public class CityModel: BaseModel
    {
        public CityModel(IConfiguration config, string con) : base(config, con)
        {

        }

    }
}

