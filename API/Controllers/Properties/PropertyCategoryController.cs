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

    /// <summary>
    /// Defines the <see cref="PropertyCategoryController" />.
    /// </summary>
    [Authorize]
    [Route("Properties/[controller]")]
    [ApiController]
    public class PropertyCategoryController: ControllerBase
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly PropertyCategoryService business;
        private string spForRead = "Properties.PropertyCategory_READ";
        private string spForList = "Properties.PropertyCategory_LIST";
        private string spForCreate = "Properties.PropertyCategory_CREATE";
        private string spForUpdate = "Properties.PropertyCategory_UPDATE";
        private string spForDelete = "Properties.PropertyCategory_DELETE";

        /// <summary>
        /// Initializes a new instance of the <see cref="PropertyCategoryController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public PropertyCategoryController(IConfiguration config)
        {
            business = new PropertyCategoryService(config, "Development");
        }

        /// <summary>
        /// The GetPropertyCategory.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet]
        public async Task<IActionResult> GetPropertyCategory(Int32? PropertyCategoryId, String CategoryName)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"PropertyCategoryId", PropertyCategoryId },
				{"CategoryName", CategoryName }
            };

            var result = await business.ExecStoreProcedure(parameters, spForRead);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetPropertyCategory.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListPropertyCategory(Int32? PropertyCategoryId, String CategoryName)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"PropertyCategoryId", PropertyCategoryId },
				{"CategoryName", CategoryName }
            };

            var result = await business.ExecStoreProcedure(parameters, spForList);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetPropertyCategory.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{PropertyCategoryId}")]
        public async Task<IActionResult> GetPropertyCategory(Int32 PropertyCategoryId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"PropertyCategoryId", PropertyCategoryId },
				{"CategoryName", null }
            };

            var result = await business.ExecStoreProcedure(parameters, spForRead);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PostPropertyCategory.
        /// </summary>
        /// <param name="model">The model<see cref="PropertyCategoryEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostPropertyCategory(PropertyCategoryEntity model)
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
				{"CategoryName", model.CategoryName }
            };

            var result = await business.ExecStoreProcedure(parameters, spForCreate);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PutPropertyCategory.
        /// </summary>
        /// <param name="model">The model<see cref="PropertyCategoryEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutPropertyCategory(PropertyCategoryEntity model)
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
				{"PropertyCategoryId", model.PropertyCategoryId },
				{"CategoryName", model.CategoryName }
            };

            var result = await business.ExecStoreProcedure(parameters, spForUpdate);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The DeletePropertyCategory.
        /// </summary>
        /// <param name="model">The model<see cref="PropertyCategoryEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{PropertyCategoryId}")]
        public async Task<IActionResult> DeletePropertyCategory(Int32? PropertyCategoryId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"PropertyCategoryId", PropertyCategoryId }
            };

            var result = await business.ExecStoreProcedure(parameters, spForDelete);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

    }
}

