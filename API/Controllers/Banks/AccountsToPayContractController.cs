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
    /// Defines the <see cref="AccountsToPayContractController" />.
    /// </summary>
    [Authorize]
    [Route("Banks/[controller]")]
    [ApiController]
    public class AccountsToPayContractController: ControllerBase
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly AccountsToPayContractService business;
        private string spForRead = "Banks.AccountsToPayContract_READ";
        private string spForList = "Banks.AccountsToPayContract_LIST";
        private string spForCreate = "Banks.AccountsToPayContract_CREATE";
        private string spForUpdate = "Banks.AccountsToPayContract_UPDATE";
        private string spForDelete = "Banks.AccountsToPayContract_DELETE";

        /// <summary>
        /// Initializes a new instance of the <see cref="AccountsToPayContractController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public AccountsToPayContractController(AccountsToPayContractService accountsToPayContractService)
        {
            business = accountsToPayContractService;
        }

        /// <summary>
        /// The GetAccountsToPayContract.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet]
        public async Task<IActionResult> GetAccountsToPayContract(Int32? AccountsToPayContractId, Int32? AccountsStatusId, Int32? ContractId, Int32? CompayId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"AccountsToPayContractId", AccountsToPayContractId },
				{"AccountsStatusId", AccountsStatusId },
				{"ContractId", ContractId },
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
        /// The GetAccountsToPayContract.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListAccountsToPayContract(Int32? AccountsToPayContractId, Int32? AccountsStatusId, Int32? ContractId, Int32? CompayId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"AccountsToPayContractId", AccountsToPayContractId },
				{"AccountsStatusId", AccountsStatusId },
				{"ContractId", ContractId },
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
        /// The GetAccountsToPayContract.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{AccountsToPayContractId}")]
        public async Task<IActionResult> GetAccountsToPayContract(Int32 AccountsToPayContractId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"AccountsToPayContractId", AccountsToPayContractId },
				{"AccountsStatusId", null },
				{"ContractId", null },
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
        /// The PostAccountsToPayContract.
        /// </summary>
        /// <param name="model">The model<see cref="AccountsToPayContractEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostAccountsToPayContract(AccountsToPayContractEntity model)
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
				{"QuotaNumber", model.QuotaNumber },
				{"Value", model.Value },
				{"ExpirationDate", model.ExpirationDate },
				{"AccountsStatusId", model.AccountsStatusId },
				{"ContractId", model.ContractId },
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
        /// The PutAccountsToPayContract.
        /// </summary>
        /// <param name="model">The model<see cref="AccountsToPayContractEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutAccountsToPayContract(AccountsToPayContractEntity model)
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
				{"AccountsToPayContractId", model.AccountsToPayContractId },
				{"QuotaNumber", model.QuotaNumber },
				{"Value", model.Value },
				{"ExpirationDate", model.ExpirationDate },
				{"AccountsStatusId", model.AccountsStatusId },
				{"ContractId", model.ContractId },
				{"CompayId", model.CompayId }
            };

            var result = await business.ExecStoreProcedure(parameters, spForUpdate); ;
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The DeleteAccountsToPayContract.
        /// </summary>
        /// <param name="model">The model<see cref="AccountsToPayContractEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{AccountsToPayContractId}")]
        public async Task<IActionResult> DeleteAccountsToPayContract(Int32? AccountsToPayContractId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"AccountsToPayContractId", AccountsToPayContractId }
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

