namespace Business.Properties
{
    using DataAccess.Properties;
    using global::Commons.DTOs.Properties;

    /// <summary>
    /// Defines the <see cref="ImagesService" />.
    /// </summary>
    public class ImagesService : BaseService<ImagesDTO>
    {

        public ImagesService(ImagesModel model) : base(model)
        {

        }

    }
}

