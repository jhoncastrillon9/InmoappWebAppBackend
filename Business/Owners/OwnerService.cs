namespace Business.Owners
{
    using DataAccess.Owners;
    using global::Commons.DTOs.Owners;
    using Microsoft.Extensions.Configuration;

    /// <summary>
    /// Defines the <see cref="OwnerService" />.
    /// </summary>
    public class OwnerService : BaseService<OwnerDTO>
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ZoneService"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>
        public OwnerService(OwnerModel model) : base(model)
        {

        }

    }
}

