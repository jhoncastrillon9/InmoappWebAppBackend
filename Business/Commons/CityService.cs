namespace Business.Commons
{
    using AutoMapper;
    using DataAccess;
    using DataAccess.Commons;
    using DataAccess.Data;

    /// <summary>
    /// Defines the <see cref="CityService" />.
    /// </summary>
    public class CityService : BaseService<City>
    {
        public CityService(CityModel model, IMapper mapper, BaseStoreProcedureModel spModel) : base(model, mapper, spModel)
        {

        }
    }
}

