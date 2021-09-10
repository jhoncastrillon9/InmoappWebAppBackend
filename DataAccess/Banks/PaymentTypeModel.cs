namespace DataAccess.Banks
{
    using CodeMono.DataAccess.DBConnection;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="PaymentTypeModel" />.
    /// </summary>
    public class PaymentTypeModel: BaseModel
    {
        public PaymentTypeModel(DBConnectionMSSQL db) : base(db)
        {

        }

    }
}

