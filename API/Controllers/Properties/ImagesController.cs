namespace API.Controllers
{
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Extensions.Configuration;
    using System;
    using System.Collections.Generic;
    using System.Security.Claims;
    using System.Threading.Tasks;

    using Business.Properties;
    using Entities.Properties;
    using Commons.DTOs.Properties;

    /// <summary>
    /// Defines the <see cref="ImagesController" />.
    /// </summary>
    [Authorize]
    [Route("Properties/[controller]")]
    [ApiController]
    public class ImagesController: ControllerBase
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly ImagesService business;
        private string spForRead = "Properties.Images_READ";
        private string spForList = "Properties.Images_LIST";
        private string spForCreate = "Properties.Images_CREATE";
        private string spForUpdate = "Properties.Images_UPDATE";
        private string spForDelete = "Properties.Images_DELETE";

        /// <summary>
        /// Initializes a new instance of the <see cref="ImagesController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public ImagesController(ImagesService imagesService)
        {
            business = imagesService;
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
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"ImageId", ImageId },
				{"ImageName", ImageName },
				{"Path", Path },
				{"IsMain", IsMain },
				{"PropertyId", PropertyId }
            };

            var result = await business.ExecStoreProcedure<ImagesDTO>(parameters, spForRead);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
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
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"ImageId", ImageId },
				{"ImageName", ImageName },
				{"Path", Path },
				{"IsMain", IsMain },
				{"PropertyId", PropertyId }
            };

            var result = await business.ExecStoreProcedure<ImagesDTO>(parameters, spForList);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetImages.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{ImageId}")]
        public async Task<IActionResult> GetImages(Int32 ImageId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"ImageId", ImageId },
				{"ImageName", null },
				{"Path", null },
				{"IsMain", null },
				{"PropertyId", null }
            };

            var result = await business.ExecStoreProcedure<ImagesDTO>(parameters, spForRead);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PostImages.
        /// </summary>
        /// <param name="model">The model<see cref="ImagesEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostImages(ImagesEntity model)
        {
            Int32 CreatedBy = 0;
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            if (identity != null)
            {
                CreatedBy = Int32.Parse(identity.FindFirst("userId").Value);
            }

            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"ImageName", model.ImageName },
				{"Path", model.Path },
				{"IsMain", model.IsMain },
				{"PropertyId", model.PropertyId }
            };

            var result = await business.ExecStoreProcedure<ImagesDTO>(parameters, spForCreate);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PutImages.
        /// </summary>
        /// <param name="model">The model<see cref="ImagesEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutImages(ImagesEntity model)
        {
            Int32 UpdatedBy = 0;
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            if (identity != null)
            {
                UpdatedBy = Int32.Parse(identity.FindFirst("userId").Value);
            }

            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"ImageId", model.ImageId },
				{"ImageName", model.ImageName },
				{"Path", model.Path },
				{"IsMain", model.IsMain },
				{"PropertyId", model.PropertyId }
            };

            var result = await business.ExecStoreProcedure<ImagesDTO>(parameters, spForUpdate);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The DeleteImages.
        /// </summary>
        /// <param name="model">The model<see cref="ImagesEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{ImageId}")]
        public async Task<IActionResult> DeleteImages(Int32? ImageId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"ImageId", ImageId }
            };

            var result = await business.ExecStoreProcedure<ImagesDTO>(parameters, spForDelete);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

    }
}

