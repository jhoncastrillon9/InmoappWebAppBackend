namespace DataAccess.Commons
{
    using CodeMono.DataAccess.DBConnection;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="ZoneModel" />.
    /// </summary>
    public class ZoneModel: BaseModel
    {
      
        /// <summary>
        /// Initializes a new instance of the <see cref="ZoneModel"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>
        public ZoneModel(IConfiguration config, string con):base(config, con)
        {
            
        }

       
    }
}

