namespace DataAccess.Owners
{
    using DataAccess.Data;

    /// <summary>
    /// Defines the <see cref="OwnerModel" />.
    /// </summary>
    public class OwnerModel : BaseModel<Owner>
    {
        public OwnerModel(InmmoAppContext context) : base(context)
        {

        }
    }
}

