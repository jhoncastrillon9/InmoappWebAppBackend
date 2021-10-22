namespace Business.Properties
{
    using AutoMapper;
    using DataAccess;
    using DataAccess.Data;
    using DataAccess.Properties;
    using global::Commons.DTOs;
    using global::Commons.DTOs.Properties;
    using Microsoft.AspNetCore.Http;

    /// <summary>
    /// Defines the <see cref="ImagesService" />.
    /// </summary>
    public class ImagesService : BaseService<Images>
    {

        public ImagesService(ImagesModel model, IMapper mapper, IHttpContextAccessor httpContext, BaseStoreProcedureModel spModel) : base(model, mapper, httpContext, spModel)
        {

        }


        public ResponseMDTO GetImagesFilter(int? ImageId, string ImageName, string Path, bool? IsMain, int? PropertyId, int companyIdSession)
        {
            response.data = GetAllBy(x =>
            (ImageId == null || x.ImageId == ImageId) &&
            (string.IsNullOrEmpty(ImageName) || x.ImageName.ToLower().Contains(ImageName.Trim().ToLower())) &&
            (string.IsNullOrEmpty(Path) || x.Path.ToLower().Contains(Path.Trim().ToLower())) &&
            (IsMain == null || x.IsMain == IsMain) &&
            (PropertyId == null || x.PropertyId == PropertyId) &&
            x.Property.CompayId == companyIdSession);

            return response;
        }
    }
}

