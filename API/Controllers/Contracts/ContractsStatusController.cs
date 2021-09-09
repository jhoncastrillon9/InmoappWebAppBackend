namespace API.Controllers
{
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Extensions.Configuration;
    using System;
    using System.Collections.Generic;
    using System.Security.Claims;
    using System.Threading.Tasks;

    using Business.Contracts;
    using Entities.Contracts;

    /// <summary>
    /// Defines the <see cref="ContractsStatusController" />.
    /// </summary>
    [Authorize]
    [Route("Contracts/[controller]")]
    [ApiController]
    public class ContractsStatusController: ControllerBase
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly ContractsStatusService business;

        /// <summary>
        /// Initializes a new instance of the <see cref="ContractsStatusController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public ContractsStatusController(IConfiguration config)
        {
            business = new ContractsStatusService(config, "Development");
        }

        /// <summary>
        /// The GetContractsStatus.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet]
        public async Task<IActionResult> GetContractsStatus(Int32? ContractsStatusId, String ContractsStatusName)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"ContractsStatusId", ContractsStatusId },
				{"ContractsStatusName", ContractsStatusName }
            };

            var result = await business.GetContractsStatus(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetContractsStatus.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListContractsStatus(Int32? ContractsStatusId, String ContractsStatusName)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"ContractsStatusId", ContractsStatusId },
				{"ContractsStatusName", ContractsStatusName }
            };

            var result = await business.GetListContractsStatus(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetContractsStatus.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{ContractsStatusId}")]
        public async Task<IActionResult> GetContractsStatus(Int32 ContractsStatusId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"ContractsStatusId", ContractsStatusId },
				{"ContractsStatusName", null }
            };

            var result = await business.GetContractsStatus(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PostContractsStatus.
        /// </summary>
        /// <param name="model">The model<see cref="ContractsStatusEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostContractsStatus(ContractsStatusEntity model)
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
				{"ContractsStatusName", model.ContractsStatusName }
            };

            var result = await business.PostContractsStatus(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PutContractsStatus.
        /// </summary>
        /// <param name="model">The model<see cref="ContractsStatusEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutContractsStatus(ContractsStatusEntity model)
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
				{"ContractsStatusId", model.ContractsStatusId },
				{"ContractsStatusName", model.ContractsStatusName }
            };
            
            var result = await business.PutContractsStatus(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The EnableContractsStatus.
        /// </summary>
        /// <param name="model">The model<see cref="ContractsStatusEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut("enable")]
        public async Task<IActionResult> EnableContractsStatus(ContractsStatusEntity model)
        {
            Int32 UpdatedBy = 0;
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            if (identity != null)
            {
                UpdatedBy = Int32.Parse(identity.FindFirst("userId").Value);
            }

            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"ContractsStatusId", model.ContractsStatusId }
            };
            
            var result = await business.EnableContractsStatus(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The DisableContractsStatus.
        /// </summary>
        /// <param name="model">The model<see cref="ContractsStatusEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut("disable")]
        public async Task<IActionResult> DisableContractsStatus(ContractsStatusEntity model)
        {
            Int32 DisabledBy = 0;
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            if (identity != null)
            {
                DisabledBy = Int32.Parse(identity.FindFirst("userId").Value);
            }

            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"ContractsStatusId", model.ContractsStatusId }
            };
            
            var result = await business.DisableContractsStatus(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The DeleteContractsStatus.
        /// </summary>
        /// <param name="model">The model<see cref="ContractsStatusEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{ContractsStatusId}")]
        public async Task<IActionResult> DeleteContractsStatus(Int32? ContractsStatusId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"ContractsStatusId", ContractsStatusId }
            };

            var result = await business.DeleteContractsStatus(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

    }
}

