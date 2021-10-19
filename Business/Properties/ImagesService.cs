namespace Business.Properties
{
    using AutoMapper;
    using DataAccess;
    using DataAccess.Data;
    using DataAccess.Properties;

    /// <summary>
    /// Defines the <see cref="ImagesService" />.
    /// </summary>
    public class ImagesService : BaseService<Images>
    {

        public ImagesService(ImagesModel model, IMapper mapper, BaseStoreProcedureModel spModel) : base(model, mapper, spModel)
        {

        }

    }
}

