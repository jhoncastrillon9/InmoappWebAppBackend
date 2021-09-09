namespace API.Controllers
{
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Extensions.Configuration;
    using System;
    using System.Collections.Generic;
    using System.Security.Claims;
    using System.Threading.Tasks;

    using Business.Owners;
    using Entities.Owners;

    /// <summary>
    /// Defines the <see cref="OwnerController" />.
    /// </summary>
    [Authorize]
    [Route("Owners/[controller]")]
    [ApiController]
    public class OwnerController: ControllerBase
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly OwnerService business;

        /// <summary>
        /// Initializes a new instance of the <see cref="OwnerController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public OwnerController(IConfiguration config)
        {
            business = new OwnerService(config, "Development");
        }

        /// <summary>
        /// The GetOwner.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet]
        public async Task<IActionResult> GetOwner(Int32? OwnerId, String OwnerName, String Document, String Telephone, String Mobile, String Email, String Address, String Observation, Int32? CompayId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"OwnerId", OwnerId },
				{"OwnerName", OwnerName },
				{"Document", Document },
				{"Telephone", Telephone },
				{"Mobile", Mobile },
				{"Email", Email },
				{"Address", Address },
				{"Observation", Observation },
				{"CompayId", CompayId }
            };

            var result = await business.GetOwner(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetOwner.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListOwner(Int32? OwnerId, String OwnerName, String Document, String Telephone, String Mobile, String Email, String Address, String Observation, Int32? CompayId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"OwnerId", OwnerId },
				{"OwnerName", OwnerName },
				{"Document", Document },
				{"Telephone", Telephone },
				{"Mobile", Mobile },
				{"Email", Email },
				{"Address", Address },
				{"Observation", Observation },
				{"CompayId", CompayId }
            };

            var result = await business.GetListOwner(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetOwner.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{OwnerId}")]
        public async Task<IActionResult> GetOwner(Int32 OwnerId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"OwnerId", OwnerId },
				{"OwnerName", null },
				{"Document", null },
				{"Telephone", null },
				{"Mobile", null },
				{"Email", null },
				{"Address", null },
				{"Observation", null },
				{"CompayId", null }
            };

            var result = await business.GetOwner(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PostOwner.
        /// </summary>
        /// <param name="model">The model<see cref="OwnerEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostOwner(OwnerEntity model)
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
				{"OwnerName", model.OwnerName },
				{"Document", model.Document },
				{"Telephone", model.Telephone },
				{"Mobile", model.Mobile },
				{"Email", model.Email },
				{"Address", model.Address },
				{"Observation", model.Observation },
				{"CompayId", model.CompayId }
            };

            var result = await business.PostOwner(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PutOwner.
        /// </summary>
        /// <param name="model">The model<see cref="OwnerEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutOwner(OwnerEntity model)
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
				{"OwnerId", model.OwnerId },
				{"OwnerName", model.OwnerName },
				{"Document", model.Document },
				{"Telephone", model.Telephone },
				{"Mobile", model.Mobile },
				{"Email", model.Email },
				{"Address", model.Address },
				{"Observation", model.Observation },
				{"CompayId", model.CompayId }
            };
            
            var result = await business.PutOwner(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The EnableOwner.
        /// </summary>
        /// <param name="model">The model<see cref="OwnerEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut("enable")]
        public async Task<IActionResult> EnableOwner(OwnerEntity model)
        {
            Int32 UpdatedBy = 0;
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            if (identity != null)
            {
                UpdatedBy = Int32.Parse(identity.FindFirst("userId").Value);
            }

            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"OwnerId", model.OwnerId }
            };
            
            var result = await business.EnableOwner(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The DisableOwner.
        /// </summary>
        /// <param name="model">The model<see cref="OwnerEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut("disable")]
        public async Task<IActionResult> DisableOwner(OwnerEntity model)
        {
            Int32 DisabledBy = 0;
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            if (identity != null)
            {
                DisabledBy = Int32.Parse(identity.FindFirst("userId").Value);
            }

            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"OwnerId", model.OwnerId }
            };
            
            var result = await business.DisableOwner(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The DeleteOwner.
        /// </summary>
        /// <param name="model">The model<see cref="OwnerEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{OwnerId}")]
        public async Task<IActionResult> DeleteOwner(Int32? OwnerId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"OwnerId", OwnerId }
            };

            var result = await business.DeleteOwner(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

    }
}

