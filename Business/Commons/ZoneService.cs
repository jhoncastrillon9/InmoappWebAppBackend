namespace Business.Commons
{
    using DataAccess;
    using DataAccess.Commons;
    using Microsoft.Extensions.Configuration;
    using System.Security.Policy;
    using Zone = DataAccess.Data.Zone;

    /// <summary>
    /// Defines the <see cref="ZoneService" />.
    /// </summary>
    public class ZoneService : BaseService<Zone>
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ZoneService"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>        
        public ZoneService(ZoneModel model, BaseStoreProcedureModel spModel) : base(model, spModel)
        {

        }
    }
}

