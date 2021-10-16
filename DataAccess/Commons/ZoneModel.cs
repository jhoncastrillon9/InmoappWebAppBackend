namespace DataAccess.Commons
{
    using DataAccess.Data;
    using Microsoft.Extensions.Configuration;

    /// <summary>
    /// Defines the <see cref="ZoneModel" />.
    /// </summary>
    public class ZoneModel : BaseModel<Zone>
    {

        /// <summary>
        /// Initializes a new instance of the <see cref="ZoneModel"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>
        public ZoneModel(InmmoAppContext context) : base(context)
        {

        }


    }
}

