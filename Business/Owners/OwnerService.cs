namespace Business.Owners
{
    using DataAccess;
    using DataAccess.Data;
    using DataAccess.Owners;
    using global::Commons.DTOs.Owners;
    using Microsoft.Extensions.Configuration;

    /// <summary>
    /// Defines the <see cref="OwnerService" />.
    /// </summary>
    public class OwnerService : BaseService<Owner>
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ZoneService"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>
        public OwnerService(OwnerModel model, BaseStoreProcedureModel spModel) : base(model, spModel)
        {

        }

    }
}

