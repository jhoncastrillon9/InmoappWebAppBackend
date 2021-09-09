namespace API.Controllers
{
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Extensions.Configuration;
    using System;
    using System.Collections.Generic;
    using System.Security.Claims;
    using System.Threading.Tasks;

    using Business.Banks;
    using Entities.Banks;

    /// <summary>
    /// Defines the <see cref="AccountsStatusController" />.
    /// </summary>
    [Authorize]
    [Route("Banks/[controller]")]
    [ApiController]
    public class AccountsStatusController: ControllerBase
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly AccountsStatusService business;

        /// <summary>
        /// Initializes a new instance of the <see cref="AccountsStatusController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public AccountsStatusController(IConfiguration config)
        {
            business = new AccountsStatusService(config, "Development");
        }

        /// <summary>
        /// The GetAccountsStatus.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet]
        public async Task<IActionResult> GetAccountsStatus(Int32? AccountsStatusId, String AccountsStatusName)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"AccountsStatusId", AccountsStatusId },
				{"AccountsStatusName", AccountsStatusName }
            };

            var result = await business.GetAccountsStatus(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetAccountsStatus.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListAccountsStatus(Int32? AccountsStatusId, String AccountsStatusName)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"AccountsStatusId", AccountsStatusId },
				{"AccountsStatusName", AccountsStatusName }
            };

            var result = await business.GetListAccountsStatus(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetAccountsStatus.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{AccountsStatusId}")]
        public async Task<IActionResult> GetAccountsStatus(Int32 AccountsStatusId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"AccountsStatusId", AccountsStatusId },
				{"AccountsStatusName", null }
            };

            var result = await business.GetAccountsStatus(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PostAccountsStatus.
        /// </summary>
        /// <param name="model">The model<see cref="AccountsStatusModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostAccountsStatus(AccountsStatusModel model)
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
				{"AccountsStatusName", model.AccountsStatusName }
            };

            var result = await business.PostAccountsStatus(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PutAccountsStatus.
        /// </summary>
        /// <param name="model">The model<see cref="AccountsStatusModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutAccountsStatus(AccountsStatusModel model)
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
				{"AccountsStatusId", model.AccountsStatusId },
				{"AccountsStatusName", model.AccountsStatusName }
            };
            
            var result = await business.PutAccountsStatus(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The EnableAccountsStatus.
        /// </summary>
        /// <param name="model">The model<see cref="AccountsStatusModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut("enable")]
        public async Task<IActionResult> EnableAccountsStatus(AccountsStatusModel model)
        {
            Int32 UpdatedBy = 0;
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            if (identity != null)
            {
                UpdatedBy = Int32.Parse(identity.FindFirst("userId").Value);
            }

            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"AccountsStatusId", model.AccountsStatusId }
            };
            
            var result = await business.EnableAccountsStatus(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The DisableAccountsStatus.
        /// </summary>
        /// <param name="model">The model<see cref="AccountsStatusModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut("disable")]
        public async Task<IActionResult> DisableAccountsStatus(AccountsStatusModel model)
        {
            Int32 DisabledBy = 0;
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            if (identity != null)
            {
                DisabledBy = Int32.Parse(identity.FindFirst("userId").Value);
            }

            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"AccountsStatusId", model.AccountsStatusId }
            };
            
            var result = await business.DisableAccountsStatus(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The DeleteAccountsStatus.
        /// </summary>
        /// <param name="model">The model<see cref="AccountsStatusModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{AccountsStatusId}")]
        public async Task<IActionResult> DeleteAccountsStatus(Int32? AccountsStatusId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"AccountsStatusId", AccountsStatusId }
            };

            var result = await business.DeleteAccountsStatus(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

    }
}

