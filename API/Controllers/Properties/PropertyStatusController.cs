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
    /// Defines the <see cref="PropertyStatusController" />.
    /// </summary>
    [Authorize]
    [Route("Properties/[controller]")]
    [ApiController]
    public class PropertyStatusController: ControllerBase
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly PropertyStatusService business;

        /// <summary>
        /// Initializes a new instance of the <see cref="PropertyStatusController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public PropertyStatusController(IConfiguration config)
        {
            business = new PropertyStatusService(config, "Development");
        }

        /// <summary>
        /// The GetPropertyStatus.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet]
        public async Task<IActionResult> GetPropertyStatus(Int32? PropertyStatusId, String PropertyStatusName)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"PropertyStatusId", PropertyStatusId },
				{"PropertyStatusName", PropertyStatusName }
            };

            var result = await business.GetPropertyStatus(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetPropertyStatus.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListPropertyStatus(Int32? PropertyStatusId, String PropertyStatusName)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"PropertyStatusId", PropertyStatusId },
				{"PropertyStatusName", PropertyStatusName }
            };

            var result = await business.GetListPropertyStatus(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetPropertyStatus.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{PropertyStatusId}")]
        public async Task<IActionResult> GetPropertyStatus(Int32 PropertyStatusId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"PropertyStatusId", PropertyStatusId },
				{"PropertyStatusName", null }
            };

            var result = await business.GetPropertyStatus(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PostPropertyStatus.
        /// </summary>
        /// <param name="model">The model<see cref="PropertyStatusModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostPropertyStatus(PropertyStatusModel model)
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
				{"PropertyStatusName", model.PropertyStatusName }
            };

            var result = await business.PostPropertyStatus(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PutPropertyStatus.
        /// </summary>
        /// <param name="model">The model<see cref="PropertyStatusModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutPropertyStatus(PropertyStatusModel model)
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
				{"PropertyStatusId", model.PropertyStatusId },
				{"PropertyStatusName", model.PropertyStatusName }
            };
            
            var result = await business.PutPropertyStatus(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The EnablePropertyStatus.
        /// </summary>
        /// <param name="model">The model<see cref="PropertyStatusModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut("enable")]
        public async Task<IActionResult> EnablePropertyStatus(PropertyStatusModel model)
        {
            Int32 UpdatedBy = 0;
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            if (identity != null)
            {
                UpdatedBy = Int32.Parse(identity.FindFirst("userId").Value);
            }

            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"PropertyStatusId", model.PropertyStatusId }
            };
            
            var result = await business.EnablePropertyStatus(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The DisablePropertyStatus.
        /// </summary>
        /// <param name="model">The model<see cref="PropertyStatusModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut("disable")]
        public async Task<IActionResult> DisablePropertyStatus(PropertyStatusModel model)
        {
            Int32 DisabledBy = 0;
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            if (identity != null)
            {
                DisabledBy = Int32.Parse(identity.FindFirst("userId").Value);
            }

            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"PropertyStatusId", model.PropertyStatusId }
            };
            
            var result = await business.DisablePropertyStatus(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The DeletePropertyStatus.
        /// </summary>
        /// <param name="model">The model<see cref="PropertyStatusModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{PropertyStatusId}")]
        public async Task<IActionResult> DeletePropertyStatus(Int32? PropertyStatusId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"PropertyStatusId", PropertyStatusId }
            };

            var result = await business.DeletePropertyStatus(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

    }
}

