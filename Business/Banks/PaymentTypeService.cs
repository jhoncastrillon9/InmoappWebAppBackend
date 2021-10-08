namespace Business.Banks
{
    using DataAccess;
    using DataAccess.Banks;
    using DataAccess.Data;
    using global::Commons.DTOs.Banks;
    using Microsoft.Extensions.Configuration;

    /// <summary>
    /// Defines the <see cref="PaymentTypeService" />.
    /// </summary>
    public class PaymentTypeService : BaseService<PaymentType>
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ZoneService"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>        
        public PaymentTypeService(PaymentTypeModel model, BaseStoreProcedureModel spModel) : base(model, spModel)
        {

        }

    }
}

