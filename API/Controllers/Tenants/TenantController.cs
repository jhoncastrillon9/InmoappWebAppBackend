namespace API.Controllers
{
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Extensions.Configuration;
    using System;
    using System.Collections.Generic;
    using System.Security.Claims;
    using System.Threading.Tasks;

    using Business.Tenants;
    using Entities.Tenants;

    /// <summary>
    /// Defines the <see cref="TenantController" />.
    /// </summary>
    [Authorize]
    [Route("Tenants/[controller]")]
    [ApiController]
    public class TenantController: ControllerBase
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly TenantService business;
        private string spForRead = "Tenants.Tenant_READ";
        private string spForList = "Tenants.Tenant_LIST";
        private string spForCreate = "Tenants.Tenant_CREATE";
        private string spForUpdate = "Tenants.Tenant_UPDATE";
        private string spForDelete = "Tenants.Tenant_DELETE";

        /// <summary>
        /// Initializes a new instance of the <see cref="TenantController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public TenantController(TenantService tenantService)
        {
            business = tenantService;
        }

        /// <summary>
        /// The GetTenant.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet]
        public async Task<IActionResult> GetTenant(Int32? TenantId, String TenantName, String Document, String Telephone, String Mobile, String Email, String Address, String Observation, Int32? CompayId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"TenantId", TenantId },
				{"TenantName", TenantName },
				{"Document", Document },
				{"Telephone", Telephone },
				{"Mobile", Mobile },
				{"Email", Email },
				{"Address", Address },
				{"Observation", Observation },
				{"CompayId", CompayId }
            };

            var result = await business.ExecStoreProcedure(parameters, spForRead);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetTenant.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListTenant(Int32? TenantId, String TenantName, String Document, String Telephone, String Mobile, String Email, String Address, String Observation, Int32? CompayId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"TenantId", TenantId },
				{"TenantName", TenantName },
				{"Document", Document },
				{"Telephone", Telephone },
				{"Mobile", Mobile },
				{"Email", Email },
				{"Address", Address },
				{"Observation", Observation },
				{"CompayId", CompayId }
            };

            var result = await business.ExecStoreProcedure(parameters, spForList);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetTenant.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{TenantId}")]
        public async Task<IActionResult> GetTenant(Int32 TenantId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"TenantId", TenantId },
				{"TenantName", null },
				{"Document", null },
				{"Telephone", null },
				{"Mobile", null },
				{"Email", null },
				{"Address", null },
				{"Observation", null },
				{"CompayId", null }
            };

            var result = await business.ExecStoreProcedure(parameters, spForRead);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PostTenant.
        /// </summary>
        /// <param name="model">The model<see cref="TenantEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostTenant(TenantEntity model)
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
				{"TenantName", model.TenantName },
				{"Document", model.Document },
				{"Telephone", model.Telephone },
				{"Mobile", model.Mobile },
				{"Email", model.Email },
				{"Address", model.Address },
				{"Observation", model.Observation },
				{"CompayId", model.CompayId }
            };

            var result = await business.ExecStoreProcedure(parameters, spForCreate);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PutTenant.
        /// </summary>
        /// <param name="model">The model<see cref="TenantEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutTenant(TenantEntity model)
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
				{"TenantId", model.TenantId },
				{"TenantName", model.TenantName },
				{"Document", model.Document },
				{"Telephone", model.Telephone },
				{"Mobile", model.Mobile },
				{"Email", model.Email },
				{"Address", model.Address },
				{"Observation", model.Observation },
				{"CompayId", model.CompayId }
            };

            var result = await business.ExecStoreProcedure(parameters, spForUpdate);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }
       

        /// <summary>
        /// The DeleteTenant.
        /// </summary>
        /// <param name="model">The model<see cref="TenantEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{TenantId}")]
        public async Task<IActionResult> DeleteTenant(Int32? TenantId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"TenantId", TenantId }
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

