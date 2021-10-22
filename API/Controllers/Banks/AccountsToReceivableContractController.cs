namespace API.Controllers
{
    using Business.Banks;
    using Commons.DTOs.Banks;
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Extensions.Configuration;
    using System;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="AccountsToReceivableContractController" />.
    /// </summary>
    [Authorize(Roles = "SuperAdmin,CompanyAdmin,FinanceUser")]
    [Route("Banks/[controller]")]
    [ApiController]
    public class AccountsToReceivableContractController : BaseController
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly AccountsToReceivableContractService _AccountsToReceivableContractService;
        private readonly string spForRead = "Banks.AccountsToReceivableContract_READ";
        private readonly string spForList = "Banks.AccountsToReceivableContract_LIST";
        private readonly string spForCreate = "Banks.AccountsToReceivableContract_CREATE";
        private readonly string spForUpdate = "Banks.AccountsToReceivableContract_UPDATE";
        private readonly string spForDelete = "Banks.AccountsToReceivableContract_DELETE";
        /// <summary>
        /// Initializes a new instance of the <see cref="AccountsToReceivableContractController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public AccountsToReceivableContractController(AccountsToReceivableContractService accountsToReceivableContractService)
        {
            _AccountsToReceivableContractService = accountsToReceivableContractService;
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
            try
            {
                LoadUserSession();
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"AccountsToReceivableContractId", AccountsToReceivableContractId },
                    {"AccountsStatusId", AccountsStatusId },
                    {"ContractId", ContractId },
                    {"CompayId", companyIdSession }
                };

                response = await _AccountsToReceivableContractService.ExecStoreProcedure<AccountsToReceivableContractDTO>(parameters, spForRead);
                return new OkObjectResult(response);

            }
            catch (ApplicationException ex)
            {
                response.executionError = true;
                response.message = ex.Message;
                return new BadRequestObjectResult(response);
            }
            catch (Exception ex)
            {
                response.executionError = true;
                return new BadRequestObjectResult(response);
            }


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
            try
            {
                LoadUserSession();
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"AccountsToReceivableContractId", AccountsToReceivableContractId },
                    {"AccountsStatusId", AccountsStatusId },
                    {"ContractId", ContractId },
                    {"CompayId", companyIdSession }
                };

                response = await _AccountsToReceivableContractService.ExecStoreProcedure<AccountsToReceivableContractDTO>(parameters, spForList);
                return new OkObjectResult(response);

            }
            catch (ApplicationException ex)
            {
                response.executionError = true;
                response.message = ex.Message;
                return new BadRequestObjectResult(response);
            }
            catch (Exception ex)
            {
                response.executionError = true;
                return new BadRequestObjectResult(response);
            }

        }

        /// <summary>
        /// The GetAccountsToReceivableContract.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{AccountsToReceivableContractId}")]
        public async Task<IActionResult> GetAccountsToReceivableContract(Int32 AccountsToReceivableContractId)
        {
            try
            {
                LoadUserSession();
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"AccountsToReceivableContractId", AccountsToReceivableContractId },
                    {"AccountsStatusId", null },
                    {"ContractId", null },
                    {"CompayId", companyIdSession }
                };

                response = await _AccountsToReceivableContractService.ExecStoreProcedure<AccountsToReceivableContractDTO>(parameters, spForRead);
                return new OkObjectResult(response);
            }
            catch (ApplicationException ex)
            {
                response.executionError = true;
                response.message = ex.Message;
                return new BadRequestObjectResult(response);
            }
            catch (Exception ex)
            {
                response.executionError = true;
                return new BadRequestObjectResult(response);
            }

        }

        /// <summary>
        /// The PostAccountsToReceivableContract.
        /// </summary>
        /// <param name="model">The model<see cref="AccountsToReceivableContractEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostAccountsToReceivableContract(AccountsToReceivableContractDTO model)
        {
            try
            {
                LoadUserSession();
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"QuotaNumber", model.QuotaNumber },
                    {"Value", model.Value },
                    {"ExpirationDate", model.ExpirationDate },
                    {"AccountsStatusId", model.AccountsStatusId },
                    {"ContractId", model.ContractId },
                    {"CompayId", companyIdSession }
                };

                response = await _AccountsToReceivableContractService.ExecStoreProcedure<AccountsToReceivableContractDTO>(parameters, spForCreate);

                return new OkObjectResult(response);

            }
            catch (ApplicationException ex)
            {
                response.executionError = true;
                response.message = ex.Message;
                return new BadRequestObjectResult(response);
            }
            catch (Exception ex)
            {
                response.executionError = true;
                return new BadRequestObjectResult(response);
            }

        }

        /// <summary>
        /// The PutAccountsToReceivableContract.
        /// </summary>
        /// <param name="model">The model<see cref="AccountsToReceivableContractEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutAccountsToReceivableContract(AccountsToReceivableContractDTO model)
        {
            try
            {
                LoadUserSession();
                ValidateCompany(_AccountsToReceivableContractService.FindById(model.AccountsToReceivableContractId).CompayId);

                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"AccountsToReceivableContractId", model.AccountsToReceivableContractId },
                    {"QuotaNumber", model.QuotaNumber },
                    {"Value", model.Value },
                    {"ExpirationDate", model.ExpirationDate },
                    {"AccountsStatusId", model.AccountsStatusId },
                    {"ContractId", model.ContractId },
                    {"CompayId", companyIdSession}
                };

                response = await _AccountsToReceivableContractService.ExecStoreProcedure<AccountsToReceivableContractDTO>(parameters, spForUpdate);
                return new OkObjectResult(response);
            }
            catch (ApplicationException ex)
            {
                response.executionError = true;
                response.message = ex.Message;
                return new BadRequestObjectResult(response);
            }
            catch (Exception ex)
            {
                response.executionError = true;
                return new BadRequestObjectResult(response);
            }
        }


        /// <summary>
        /// The DeleteAccountsToReceivableContract.
        /// </summary>
        /// <param name="model">The model<see cref="AccountsToReceivableContractEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{AccountsToReceivableContractId}")]
        public async Task<IActionResult> DeleteAccountsToReceivableContract(Int32? AccountsToReceivableContractId)
        {
            try
            {
                LoadUserSession();
                ValidateCompany(_AccountsToReceivableContractService.FindById(AccountsToReceivableContractId).CompayId);

                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                    {
                        {"AccountsToReceivableContractId", AccountsToReceivableContractId }
                    };

                response = await _AccountsToReceivableContractService.ExecStoreProcedure<AccountsToReceivableContractDTO>(parameters, spForDelete);
                return new OkObjectResult(response);

            }
            catch (ApplicationException ex)
            {
                response.executionError = true;
                response.message = ex.Message;
                return new BadRequestObjectResult(response);
            }
            catch (Exception ex)
            {
                response.executionError = true;
                return new BadRequestObjectResult(response);
            }

        }

    }
}

