namespace DataAccess.Commons
{
    using DataAccess.Data;

    /// <summary>
    /// Defines the <see cref="CityModel" />.
    /// </summary>
    public class CityModel : BaseModel<City>
    {
        public CityModel(InmmoAppContext context) : base(context)
        {

        }

    }
}

