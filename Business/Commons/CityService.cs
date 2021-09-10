namespace Business.Commons
{
    using DataAccess.Commons;
    using global::Commons.DTOs.Commons;

    /// <summary>
    /// Defines the <see cref="CityService" />.
    /// </summary>
    public class CityService : BaseService<CityDTO>
    {
        public CityService(ZoneModel model) : base(model)
        {

        }
    }
}

