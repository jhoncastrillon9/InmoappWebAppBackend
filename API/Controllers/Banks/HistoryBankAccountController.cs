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
    /// Defines the <see cref="HistoryBankAccountController" />.
    /// </summary>
    [Authorize]
    [Route("Banks/[controller]")]
    [ApiController]
    public class HistoryBankAccountController: ControllerBase
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly HistoryBankAccountService business;
        private string spForRead = "Banks.HistoryBankAccount_READ";
        private string spForList = "Banks.HistoryBankAccount_LIST";
        private string spForCreate = "Banks.HistoryBankAccount_CREATE";
        private string spForUpdate = "Banks.HistoryBankAccount_UPDATE";
        private string spForDelete = "Banks.HistoryBankAccount_DELETE";

        /// <summary>
        /// Initializes a new instance of the <see cref="HistoryBankAccountController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public HistoryBankAccountController(IConfiguration config)
        {
            business = new HistoryBankAccountService(config, "Development");
        }

        /// <summary>
        /// The GetHistoryBankAccount.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet]
        public async Task<IActionResult> GetHistoryBankAccount(Int32? HistoryBankAccountId, Int32? PaymentTypeId, Int32? BankAccountId, Int32? AccountsToPayContractsId, Int32? AccountsToReceivableContractsId, String Obervation, Int32? CompayId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"HistoryBankAccountId", HistoryBankAccountId },
				{"PaymentTypeId", PaymentTypeId },
				{"BankAccountId", BankAccountId },
				{"AccountsToPayContractsId", AccountsToPayContractsId },
				{"AccountsToReceivableContractsId", AccountsToReceivableContractsId },
				{"Obervation", Obervation },
				{"CompayId", CompayId }
            };

            var result = await business.GetHistoryBankAccount(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetHistoryBankAccount.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListHistoryBankAccount(Int32? HistoryBankAccountId, Int32? PaymentTypeId, Int32? BankAccountId, Int32? AccountsToPayContractsId, Int32? AccountsToReceivableContractsId, String Obervation, Int32? CompayId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"HistoryBankAccountId", HistoryBankAccountId },
				{"PaymentTypeId", PaymentTypeId },
				{"BankAccountId", BankAccountId },
				{"AccountsToPayContractsId", AccountsToPayContractsId },
				{"AccountsToReceivableContractsId", AccountsToReceivableContractsId },
				{"Obervation", Obervation },
				{"CompayId", CompayId }
            };

            var result = await business.GetListHistoryBankAccount(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetHistoryBankAccount.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{HistoryBankAccountId}")]
        public async Task<IActionResult> GetHistoryBankAccount(Int32 HistoryBankAccountId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"HistoryBankAccountId", HistoryBankAccountId },
				{"PaymentTypeId", null },
				{"BankAccountId", null },
				{"AccountsToPayContractsId", null },
				{"AccountsToReceivableContractsId", null },
				{"Obervation", null },
				{"CompayId", null }
            };

            var result = await business.GetHistoryBankAccount(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PostHistoryBankAccount.
        /// </summary>
        /// <param name="model">The model<see cref="HistoryBankAccountEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostHistoryBankAccount(HistoryBankAccountEntity model)
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
				{"PaymentTypeId", model.PaymentTypeId },
				{"Value", model.Value },
				{"BankAccountId", model.BankAccountId },
				{"AccountsToPayContractsId", model.AccountsToPayContractsId },
				{"AccountsToReceivableContractsId", model.AccountsToReceivableContractsId },
				{"Obervation", model.Obervation },
				{"CompayId", model.CompayId }
            };

            var result = await business.PostHistoryBankAccount(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PutHistoryBankAccount.
        /// </summary>
        /// <param name="model">The model<see cref="HistoryBankAccountEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutHistoryBankAccount(HistoryBankAccountEntity model)
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
				{"HistoryBankAccountId", model.HistoryBankAccountId },
				{"PaymentTypeId", model.PaymentTypeId },
				{"Value", model.Value },
				{"BankAccountId", model.BankAccountId },
				{"AccountsToPayContractsId", model.AccountsToPayContractsId },
				{"AccountsToReceivableContractsId", model.AccountsToReceivableContractsId },
				{"Obervation", model.Obervation },
				{"CompayId", model.CompayId }
            };
            
            var result = await business.PutHistoryBankAccount(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The EnableHistoryBankAccount.
        /// </summary>
        /// <param name="model">The model<see cref="HistoryBankAccountEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut("enable")]
        public async Task<IActionResult> EnableHistoryBankAccount(HistoryBankAccountEntity model)
        {
            Int32 UpdatedBy = 0;
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            if (identity != null)
            {
                UpdatedBy = Int32.Parse(identity.FindFirst("userId").Value);
            }

            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"HistoryBankAccountId", model.HistoryBankAccountId }
            };
            
            var result = await business.EnableHistoryBankAccount(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The DisableHistoryBankAccount.
        /// </summary>
        /// <param name="model">The model<see cref="HistoryBankAccountEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut("disable")]
        public async Task<IActionResult> DisableHistoryBankAccount(HistoryBankAccountEntity model)
        {
            Int32 DisabledBy = 0;
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            if (identity != null)
            {
                DisabledBy = Int32.Parse(identity.FindFirst("userId").Value);
            }

            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"HistoryBankAccountId", model.HistoryBankAccountId }
            };
            
            var result = await business.DisableHistoryBankAccount(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The DeleteHistoryBankAccount.
        /// </summary>
        /// <param name="model">The model<see cref="HistoryBankAccountEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{HistoryBankAccountId}")]
        public async Task<IActionResult> DeleteHistoryBankAccount(Int32? HistoryBankAccountId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"HistoryBankAccountId", HistoryBankAccountId }
            };

            var result = await business.DeleteHistoryBankAccount(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

    }
}

