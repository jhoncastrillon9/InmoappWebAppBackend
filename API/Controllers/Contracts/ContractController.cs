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
    /// Defines the <see cref="ContractController" />.
    /// </summary>
    [Authorize]
    [Route("Contracts/[controller]")]
    [ApiController]
    public class ContractController: ControllerBase
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly ContractService business;

        /// <summary>
        /// Initializes a new instance of the <see cref="ContractController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public ContractController(IConfiguration config)
        {
            business = new ContractService(config, "Development");
        }

        /// <summary>
        /// The GetContract.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet]
        public async Task<IActionResult> GetContract(Int32? ContractId, String Observation, Int32? StatusId, Int32? PropertyId, Int32? TenantId, Int32? CompayId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"ContractId", ContractId },
				{"Observation", Observation },
				{"StatusId", StatusId },
				{"PropertyId", PropertyId },
				{"TenantId", TenantId },
				{"CompayId", CompayId }
            };

            var result = await business.GetContract(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetContract.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListContract(Int32? ContractId, String Observation, Int32? StatusId, Int32? PropertyId, Int32? TenantId, Int32? CompayId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"ContractId", ContractId },
				{"Observation", Observation },
				{"StatusId", StatusId },
				{"PropertyId", PropertyId },
				{"TenantId", TenantId },
				{"CompayId", CompayId }
            };

            var result = await business.GetListContract(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetContract.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{ContractId}")]
        public async Task<IActionResult> GetContract(Int32 ContractId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"ContractId", ContractId },
				{"Observation", null },
				{"StatusId", null },
				{"PropertyId", null },
				{"TenantId", null },
				{"CompayId", null }
            };

            var result = await business.GetContract(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PostContract.
        /// </summary>
        /// <param name="model">The model<see cref="ContractModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostContract(ContractModel model)
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
				{"ContractDate", model.ContractDate },
				{"InnitialDate", model.InnitialDate },
				{"QuantityMonths", model.QuantityMonths },
				{"RentalFeeForOwner", model.RentalFeeForOwner },
				{"RentalFeeForTennat", model.RentalFeeForTennat },
				{"Observation", model.Observation },
				{"StatusId", model.StatusId },
				{"PropertyId", model.PropertyId },
				{"TenantId", model.TenantId },
				{"CompayId", model.CompayId }
            };

            var result = await business.PostContract(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PutContract.
        /// </summary>
        /// <param name="model">The model<see cref="ContractModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutContract(ContractModel model)
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
				{"ContractId", model.ContractId },
				{"ContractDate", model.ContractDate },
				{"InnitialDate", model.InnitialDate },
				{"QuantityMonths", model.QuantityMonths },
				{"RentalFeeForOwner", model.RentalFeeForOwner },
				{"RentalFeeForTennat", model.RentalFeeForTennat },
				{"Observation", model.Observation },
				{"StatusId", model.StatusId },
				{"PropertyId", model.PropertyId },
				{"TenantId", model.TenantId },
				{"CompayId", model.CompayId }
            };
            
            var result = await business.PutContract(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The EnableContract.
        /// </summary>
        /// <param name="model">The model<see cref="ContractModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut("enable")]
        public async Task<IActionResult> EnableContract(ContractModel model)
        {
            Int32 UpdatedBy = 0;
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            if (identity != null)
            {
                UpdatedBy = Int32.Parse(identity.FindFirst("userId").Value);
            }

            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"ContractId", model.ContractId }
            };
            
            var result = await business.EnableContract(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The DisableContract.
        /// </summary>
        /// <param name="model">The model<see cref="ContractModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut("disable")]
        public async Task<IActionResult> DisableContract(ContractModel model)
        {
            Int32 DisabledBy = 0;
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            if (identity != null)
            {
                DisabledBy = Int32.Parse(identity.FindFirst("userId").Value);
            }

            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"ContractId", model.ContractId }
            };
            
            var result = await business.DisableContract(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The DeleteContract.
        /// </summary>
        /// <param name="model">The model<see cref="ContractModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{ContractId}")]
        public async Task<IActionResult> DeleteContract(Int32? ContractId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"ContractId", ContractId }
            };

            var result = await business.DeleteContract(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

    }
}

