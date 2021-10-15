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
    using Commons.DTOs.Banks;

    /// <summary>
    /// Defines the <see cref="AccountsToReceivableContractController" />.
    /// </summary>
    [Authorize]
    [Route("Banks/[controller]")]
    [ApiController]
    public class AccountsToReceivableContractController: ControllerBase
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly AccountsToReceivableContractService business; 
        private string spForRead = "Banks.AccountsToReceivableContract_READ";
        private string spForList = "Banks.AccountsToReceivableContract_LIST";
        private string spForCreate = "Banks.AccountsToReceivableContract_CREATE";
        private string spForUpdate = "Banks.AccountsToReceivableContract_UPDATE";
        private string spForDelete = "Banks.AccountsToReceivableContract_DELETE";
        /// <summary>
        /// Initializes a new instance of the <see cref="AccountsToReceivableContractController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public AccountsToReceivableContractController(AccountsToReceivableContractService accountsToReceivableContractService)
        {
            business = accountsToReceivableContractService;
        }

        /// <summary>
        /// The GetAccountsToReceivableContract.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet]
        public async Task<IActionResult> GetAccountsToReceivableContract(Int32? AccountsToReceivableContractId, Int32? AccountsStatusId, Int32? ContractId, Int32? CompayId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"AccountsToReceivableContractId", AccountsToReceivableContractId },
				{"AccountsStatusId", AccountsStatusId },
				{"ContractId", ContractId },
				{"CompayId", CompayId }
            };

            var result = await business.ExecStoreProcedure<AccountsToReceivableContractDTO>(parameters, spForRead);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetAccountsToReceivableContract.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListAccountsToReceivableContract(Int32? AccountsToReceivableContractId, Int32? AccountsStatusId, Int32? ContractId, Int32? CompayId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"AccountsToReceivableContractId", AccountsToReceivableContractId },
				{"AccountsStatusId", AccountsStatusId },
				{"ContractId", ContractId },
				{"CompayId", CompayId }
            };

            var result = await business.ExecStoreProcedure<AccountsToReceivableContractDTO>(parameters, spForList);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetAccountsToReceivableContract.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{AccountsToReceivableContractId}")]
        public async Task<IActionResult> GetAccountsToReceivableContract(Int32 AccountsToReceivableContractId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"AccountsToReceivableContractId", AccountsToReceivableContractId },
				{"AccountsStatusId", null },
				{"ContractId", null },
				{"CompayId", null }
            };

            var result = await business.ExecStoreProcedure<AccountsToReceivableContractDTO>(parameters, spForRead);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PostAccountsToReceivableContract.
        /// </summary>
        /// <param name="model">The model<see cref="AccountsToReceivableContractEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostAccountsToReceivableContract(AccountsToReceivableContractDTO model)
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

            var result = await business.ExecStoreProcedure<AccountsToReceivableContractDTO>(parameters, spForCreate);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PutAccountsToReceivableContract.
        /// </summary>
        /// <param name="model">The model<see cref="AccountsToReceivableContractEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutAccountsToReceivableContract(AccountsToReceivableContractDTO model)
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
				{"AccountsToReceivableContractId", model.AccountsToReceivableContractId },
				{"QuotaNumber", model.QuotaNumber },
				{"Value", model.Value },
				{"ExpirationDate", model.ExpirationDate },
				{"AccountsStatusId", model.AccountsStatusId },
				{"ContractId", model.ContractId },
				{"CompayId", model.CompayId }
            };

            var result = await business.ExecStoreProcedure<AccountsToReceivableContractDTO>(parameters, spForUpdate);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }


        /// <summary>
        /// The DeleteAccountsToReceivableContract.
        /// </summary>
        /// <param name="model">The model<see cref="AccountsToReceivableContractEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{AccountsToReceivableContractId}")]
        public async Task<IActionResult> DeleteAccountsToReceivableContract(Int32? AccountsToReceivableContractId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"AccountsToReceivableContractId", AccountsToReceivableContractId }
            };

            var result = await business.ExecStoreProcedure<AccountsToReceivableContractDTO>(parameters, spForDelete);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

    }
}

