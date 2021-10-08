namespace Business.Commons
{
    using DataAccess;
    using DataAccess.Commons;
    using DataAccess.Data;
    using global::Commons.DTOs.Commons;

    /// <summary>
    /// Defines the <see cref="CityService" />.
    /// </summary>
    public class CityService : BaseService<City>
    {
        public CityService(CityModel model, BaseStoreProcedureModel spModel) : base(model, spModel)
        {

        }
    }
}

