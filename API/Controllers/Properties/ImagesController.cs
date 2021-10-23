namespace API.Controllers
{
    using Business.Properties;
    using Commons.DTOs;
    using Commons.DTOs.Properties;
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Http;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Extensions.Configuration;
    using Microsoft.Extensions.Logging;
    using System;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="ImagesController" />.
    /// </summary>
    [Authorize(Roles = "SuperAdmin,CompanyAdmin,PropertyUser")]
    [Route("Properties/[controller]")]
    [ApiController]
    public class ImagesController : BaseController
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly ImagesService _imagesServices;
        private readonly PropertyService _PropertyService;
        private readonly string spForCreate = "Properties.Images_CREATE";
        private readonly string spForUpdate = "Properties.Images_UPDATE";
        private readonly string spForDelete = "Properties.Images_DELETE";

        /// <summary>
        /// Initializes a new instance of the <see cref="ImagesController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public ImagesController(ImagesService imagesService, PropertyService propertyService, ILogger<ImagesController> logger, IHttpContextAccessor httpContext) : base(httpContext, logger)
        {
            _imagesServices = imagesService;
            _PropertyService = propertyService;
        }

        /// <summary>
        /// The GetImages.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet]
        public async Task<IActionResult> GetImages(Int32? ImageId, String ImageName, String Path, Boolean? IsMain, Int32? PropertyId)
        {
            try
            {
                response = _imagesServices.GetImagesFilter(ImageId, ImageName, Path, IsMain, PropertyId); 
                return new OkObjectResult(response);
            }
            catch (ApplicationException ex)
            {
                response.ExecutionError = true;
                response.Message = ex.Message;
                return new BadRequestObjectResult(base.response);
            }
            catch (Exception ex)
            {
                response.ExecutionError = true;
                return new BadRequestObjectResult(base.response);
            }

          
        }

        /// <summary>
        /// The GetImages.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListImages(Int32? ImageId, String ImageName, String Path, Boolean? IsMain, Int32? PropertyId)
        {
            try
            {
                response = _imagesServices.GetImagesFilter(ImageId, ImageName, Path, IsMain, PropertyId);              

                return new OkObjectResult(response);

            }
            catch (ApplicationException ex)
            {
                response.ExecutionError = true;
                response.Message = ex.Message;
                return new BadRequestObjectResult(base.response);
            }
            catch (Exception ex)
            {
                response.ExecutionError = true;
                return new BadRequestObjectResult(base.response);
            }           
        }

        /// <summary>
        /// The GetImages.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{ImageId}")]
        public async Task<IActionResult> GetImages(Int32 ImageId)
        {
            try
            {
                ResponseMDTO result = new ResponseMDTO
                {
                    Data = _imagesServices.GetBy(x => x.ImageId == ImageId && x.Property.CompayId == currentCompanyIdUser)
                };

                return new OkObjectResult(result);
            }
            catch (ApplicationException ex)
            {
                response.ExecutionError = true;
                response.Message = ex.Message;
                return new BadRequestObjectResult(base.response);
            }
            catch (Exception ex)
            {
                response.ExecutionError = true;
                return new BadRequestObjectResult(base.response);
            }
          
        }

        /// <summary>
        /// The PostImages.
        /// </summary>
        /// <param name="dto">The model<see cref="ImagesEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostImages(ImagesDTO dto)
        {
            try
            {
                var property = _PropertyService.GetBy(x => x.PropertyId == dto.PropertyId);
                _PropertyService.ValidateCompany(property.CompayId);

                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"ImageName", dto.ImageName },
                    {"Path", dto.Path },
                    {"IsMain", dto.IsMain },
                    {"PropertyId", dto.PropertyId }
                };

                response = await _imagesServices.ExecStoreProcedure<ImagesDTO>(parameters, spForCreate);                

                return new OkObjectResult(response);

            }
            catch (ApplicationException ex)
            {
                response.ExecutionError = true;
                response.Message = ex.Message;
                return new BadRequestObjectResult(base.response);
            }
            catch (Exception ex)
            {
                response.ExecutionError = true;
                return new BadRequestObjectResult(base.response);
            }

         
        }

        /// <summary>
        /// The PutImages.
        /// </summary>
        /// <param name="model">The model<see cref="ImagesEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutImages(ImagesDTO model)
        {
            try
            {
                var imageOld = _imagesServices.GetBy(x => x.ImageId == model.ImageId);
                _imagesServices.ValidateCompany(imageOld.Property.CompayId);

                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"ImageId", model.ImageId },
                    {"ImageName", model.ImageName },
                    {"Path", model.Path },
                    {"IsMain", model.IsMain },
                    {"PropertyId", imageOld.PropertyId }
                };

                response = await _imagesServices.ExecStoreProcedure<ImagesDTO>(parameters, spForUpdate);
            
                return new OkObjectResult(response);

            }
            catch (ApplicationException ex)
            {
                response.ExecutionError = true;
                response.Message = ex.Message;
                return new BadRequestObjectResult(base.response);
            }
            catch (Exception ex)
            {
                response.ExecutionError = true;
                return new BadRequestObjectResult(base.response);
            }
          
        }

        /// <summary>
        /// The DeleteImages.
        /// </summary>
        /// <param name="model">The model<see cref="ImagesEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{ImageId}")]
        public async Task<IActionResult> DeleteImages(Int32? ImageId)
        {
            try
            {
                _imagesServices.ValidateCompany(_imagesServices.GetBy(x => x.ImageId == ImageId).Property.CompayId);

                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"ImageId", ImageId }
                };

                response = await _imagesServices.ExecStoreProcedure<ImagesDTO>(parameters, spForDelete);

                return new OkObjectResult(response);
            }
            catch (ApplicationException ex)
            {
                response.ExecutionError = true;
                response.Message = ex.Message;
                return new BadRequestObjectResult(base.response);
            }
            catch (Exception ex)
            {
                response.ExecutionError = true;
                return new BadRequestObjectResult(base.response);
            }
          
        }

    }
}

