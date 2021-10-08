namespace DataAccess.Commons
{
    using CodeMono.DataAccess.DBConnection;
    using DataAccess.Data;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="CityModel" />.
    /// </summary>
    public class CityModel: BaseModel<City>
    {
        public CityModel(InmmoAppContext context) : base(context)
        {

        }

    }
}

