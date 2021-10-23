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

        /// <summary>
        /// Filtra las images
        /// </summary>
        /// <param name="ImageId"></param>
        /// <param name="ImageName"></param>
        /// <param name="Path"></param>
        /// <param name="IsMain"></param>
        /// <param name="PropertyId"></param>
        /// <returns></returns>
        public ResponseMDTO GetImagesFilter(int? ImageId, string ImageName, string Path, bool? IsMain, int? PropertyId)
        {
            response.Data = GetAllBy(x =>
            (ImageId == null || x.ImageId == ImageId) &&
            (string.IsNullOrEmpty(ImageName) || x.ImageName.ToLower().Contains(ImageName.Trim().ToLower())) &&
            (string.IsNullOrEmpty(Path) || x.Path.ToLower().Contains(Path.Trim().ToLower())) &&
            (IsMain == null || x.IsMain == IsMain) &&
            (PropertyId == null || x.PropertyId == PropertyId) &&
            x.Property.CompayId == GetCurrentCompanyIdUser());

            return response;
        }
    }
}

