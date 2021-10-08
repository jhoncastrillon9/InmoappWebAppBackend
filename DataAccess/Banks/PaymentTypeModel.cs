namespace DataAccess.Banks
{
    using CodeMono.DataAccess.DBConnection;
    using DataAccess.Data;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="PaymentTypeModel" />.
    /// </summary>
    public class PaymentTypeModel: BaseModel<PaymentType>
    {
        public PaymentTypeModel(InmmoAppContext context) : base(context)
        {

        }

    }
}

