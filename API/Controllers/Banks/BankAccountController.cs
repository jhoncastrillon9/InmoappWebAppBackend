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
    /// Defines the <see cref="BankAccountController" />.
    /// </summary>
    [Authorize]
    [Route("Banks/[controller]")]
    [ApiController]
    public class BankAccountController: ControllerBase
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly BankAccountService business;

        /// <summary>
        /// Initializes a new instance of the <see cref="BankAccountController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public BankAccountController(IConfiguration config)
        {
            business = new BankAccountService(config, "Development");
        }

        /// <summary>
        /// The GetBankAccount.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet]
        public async Task<IActionResult> GetBankAccount(Int32? BankAccountId, String BankAccountName, Int32? CompayId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"BankAccountId", BankAccountId },
				{"BankAccountName", BankAccountName },
				{"CompayId", CompayId }
            };

            var result = await business.GetBankAccount(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetBankAccount.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListBankAccount(Int32? BankAccountId, String BankAccountName, Int32? CompayId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"BankAccountId", BankAccountId },
				{"BankAccountName", BankAccountName },
				{"CompayId", CompayId }
            };

            var result = await business.GetListBankAccount(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetBankAccount.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{BankAccountId}")]
        public async Task<IActionResult> GetBankAccount(Int32 BankAccountId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"BankAccountId", BankAccountId },
				{"BankAccountName", null },
				{"CompayId", null }
            };

            var result = await business.GetBankAccount(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PostBankAccount.
        /// </summary>
        /// <param name="model">The model<see cref="BankAccountModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostBankAccount(BankAccountModel model)
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
				{"BankAccountName", model.BankAccountName },
				{"Total", model.Total },
				{"CompayId", model.CompayId }
            };

            var result = await business.PostBankAccount(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PutBankAccount.
        /// </summary>
        /// <param name="model">The model<see cref="BankAccountModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutBankAccount(BankAccountModel model)
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
				{"BankAccountId", model.BankAccountId },
				{"BankAccountName", model.BankAccountName },
				{"Total", model.Total },
				{"CompayId", model.CompayId }
            };
            
            var result = await business.PutBankAccount(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The EnableBankAccount.
        /// </summary>
        /// <param name="model">The model<see cref="BankAccountModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut("enable")]
        public async Task<IActionResult> EnableBankAccount(BankAccountModel model)
        {
            Int32 UpdatedBy = 0;
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            if (identity != null)
            {
                UpdatedBy = Int32.Parse(identity.FindFirst("userId").Value);
            }

            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"BankAccountId", model.BankAccountId }
            };
            
            var result = await business.EnableBankAccount(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The DisableBankAccount.
        /// </summary>
        /// <param name="model">The model<see cref="BankAccountModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut("disable")]
        public async Task<IActionResult> DisableBankAccount(BankAccountModel model)
        {
            Int32 DisabledBy = 0;
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            if (identity != null)
            {
                DisabledBy = Int32.Parse(identity.FindFirst("userId").Value);
            }

            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"BankAccountId", model.BankAccountId }
            };
            
            var result = await business.DisableBankAccount(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The DeleteBankAccount.
        /// </summary>
        /// <param name="model">The model<see cref="BankAccountModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{BankAccountId}")]
        public async Task<IActionResult> DeleteBankAccount(Int32? BankAccountId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"BankAccountId", BankAccountId }
            };

            var result = await business.DeleteBankAccount(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

    }
}

