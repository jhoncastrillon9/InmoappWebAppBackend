namespace Business.Properties
{
    using DataAccess;
    using DataAccess.Data;
    using DataAccess.Properties;
    using global::Commons.DTOs.Properties;

    /// <summary>
    /// Defines the <see cref="ImagesService" />.
    /// </summary>
    public class ImagesService : BaseService<Images>
    {

        public ImagesService(ImagesModel model, BaseStoreProcedureModel spModel) : base(model, spModel)
        {

        }

    }
}

