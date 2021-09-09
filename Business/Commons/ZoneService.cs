namespace Business.Commons
{
    using DataAccess.Commons;
    using Entities.Commons;
    using Microsoft.Extensions.Configuration;

    /// <summary>
    /// Defines the <see cref="ZoneService" />.
    /// </summary>
    public class ZoneService : BaseService<ZoneResponseSP>
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ZoneService"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>
        public ZoneService( IConfiguration config, string con) : base(new ZoneModel(config, con))
        {

        }
    }
}

