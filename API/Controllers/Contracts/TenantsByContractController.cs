namespace API.Controllers
{
    using Business.Contracts;
    using Commons.DTOs.Contracts;
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Extensions.Configuration;
    using System;
    using System.Collections.Generic;
    using System.Security.Claims;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="TenantsByContractController" />.
    /// </summary>
    [Authorize]
    [Route("Contracts/[controller]")]
    [ApiController]
    public class TenantsByContractController : ControllerBase
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly TenantsByContractService business;
        private string spForRead = "Contracts.TenantsByContract_READ";
        private string spForList = "Contracts.TenantsByContract_LIST";
        private string spForCreate = "Contracts.TenantsByContract_CREATE";
        private string spForUpdate = "Contracts.TenantsByContract_UPDATE";
        private string spForDelete = "Contracts.TenantsByContract_DELETE";

        /// <summary>
        /// Initializes a new instance of the <see cref="TenantsByContractController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public TenantsByContractController(TenantsByContractService tenantsByContractService)
        {
            business = tenantsByContractService;
        }

        /// <summary>
        /// The GetTenantsByContract.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet]
        public async Task<IActionResult> GetTenantsByContract(Int32? TenantsByContractId, Int32? TenantId, String Profile)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"TenantsByContractId", TenantsByContractId },
                {"TenantId", TenantId },
                {"Profile", Profile }
            };

            var result = await business.ExecStoreProcedure<TenantsByContractDTO>(parameters, spForRead);
            if (result.ExecutionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetTenantsByContract.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListTenantsByContract(Int32? TenantsByContractId, Int32? TenantId, String Profile)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"TenantsByContractId", TenantsByContractId },
                {"TenantId", TenantId },
                {"Profile", Profile }
            };

            var result = await business.ExecStoreProcedure<TenantsByContractDTO>(parameters, spForList);
            if (result.ExecutionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetTenantsByContract.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{TenantsByContractId}")]
        public async Task<IActionResult> GetTenantsByContract(Int32 TenantsByContractId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"TenantsByContractId", TenantsByContractId },
                {"TenantId", null },
                {"Profile", null }
            };

            var result = await business.ExecStoreProcedure<TenantsByContractDTO>(parameters, spForRead);
            if (result.ExecutionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PostTenantsByContract.
        /// </summary>
        /// <param name="model">The model<see cref="TenantsByContractEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostTenantsByContract(TenantsByContractDTO model)
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
                {"TenantId", model.TenantId },
                {"Profile", model.Profile }
            };

            var result = await business.ExecStoreProcedure<TenantsByContractDTO>(parameters, spForCreate);
            if (result.ExecutionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PutTenantsByContract.
        /// </summary>
        /// <param name="model">The model<see cref="TenantsByContractEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutTenantsByContract(TenantsByContractDTO model)
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
                {"TenantsByContractId", model.TenantsByContractId },
                {"TenantId", model.TenantId },
                {"Profile", model.Profile }
            };

            var result = await business.ExecStoreProcedure<TenantsByContractDTO>(parameters, spForUpdate);
            if (result.ExecutionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The DeleteTenantsByContract.
        /// </summary>
        /// <param name="model">The model<see cref="TenantsByContractEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{TenantsByContractId}")]
        public async Task<IActionResult> DeleteTenantsByContract(Int32? TenantsByContractId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"TenantsByContractId", TenantsByContractId }
            };

            var result = await business.ExecStoreProcedure<TenantsByContractDTO>(parameters, spForDelete);
            if (result.ExecutionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

    }
}

