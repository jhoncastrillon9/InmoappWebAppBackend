namespace DataAccess.Banks
{
    using DataAccess.Data;

    /// <summary>
    /// Defines the <see cref="PaymentTypeModel" />.
    /// </summary>
    public class PaymentTypeModel : BaseModel<PaymentType>
    {
        public PaymentTypeModel(InmmoAppContext context) : base(context)
        {

        }

    }
}

