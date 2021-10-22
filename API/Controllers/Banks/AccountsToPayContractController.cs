namespace API.Controllers
{
    using Business.Banks;
    using Commons.DTOs.Banks;
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Http;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Extensions.Configuration;
    using System;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="AccountsToPayContractController" />.
    /// </summary>    
    [Authorize(Roles = "SuperAdmin,CompanyAdmin,FinanceUser")]
   
    [Route("Banks/[controller]")]
    [ApiController]
    public class AccountsToPayContractController : BaseController
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly AccountsToPayContractService _AccountsToPayContractService;
        private readonly string spForRead = "Banks.AccountsToPayContract_READ";
        private readonly string spForList = "Banks.AccountsToPayContract_LIST";
        private readonly string spForCreate = "Banks.AccountsToPayContract_CREATE";
        private readonly string spForUpdate = "Banks.AccountsToPayContract_UPDATE";
        private readonly string spForDelete = "Banks.AccountsToPayContract_DELETE";

        /// <summary>
        /// Initializes a new instance of the <see cref="AccountsToPayContractController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public AccountsToPayContractController(AccountsToPayContractService accountsToPayContractService, IHttpContextAccessor httpContext):base(httpContext)
        {
            _AccountsToPayContractService = accountsToPayContractService;
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
            try
            {               
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"AccountsToPayContractId", AccountsToPayContractId },
                    {"AccountsStatusId", AccountsStatusId },
                    {"ContractId", ContractId },
                    {"CompayId", currentUserCompanyId }
                };

                response = await _AccountsToPayContractService.ExecStoreProcedure<AccountsToPayContractDTO>(parameters, spForRead);
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
        /// The GetAccountsToPayContract.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListAccountsToPayContract(Int32? AccountsToPayContractId, Int32? AccountsStatusId, Int32? ContractId, Int32? CompayId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"AccountsToPayContractId", AccountsToPayContractId },
                    {"AccountsStatusId", AccountsStatusId },
                    {"ContractId", ContractId },
                    {"CompayId", currentUserCompanyId }
                };

                response = await _AccountsToPayContractService.ExecStoreProcedure<AccountsToPayContractDTO>(parameters, spForList);

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
        /// The GetAccountsToPayContract.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{AccountsToPayContractId}")]
        public async Task<IActionResult> GetAccountsToPayContract(Int32 AccountsToPayContractId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"AccountsToPayContractId", AccountsToPayContractId },
                    {"AccountsStatusId", null },
                    {"ContractId", null },
                    {"CompayId", currentUserCompanyId }
                };

                response = await _AccountsToPayContractService.ExecStoreProcedure<AccountsToPayContractDTO>(parameters, spForRead);
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
        /// The PostAccountsToPayContract.
        /// </summary>
        /// <param name="model">The model<see cref="AccountsToPayContractEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostAccountsToPayContract(AccountsToPayContractDTO model)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"QuotaNumber", model.QuotaNumber },
                    {"Value", model.Value },
                    {"ExpirationDate", model.ExpirationDate },
                    {"AccountsStatusId", model.AccountsStatusId },
                    {"ContractId", model.ContractId },
                    {"CompayId",currentUserCompanyId }
                };

                response = await _AccountsToPayContractService.ExecStoreProcedure<AccountsToPayContractDTO>(parameters, spForCreate);
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
        /// The PutAccountsToPayContract.
        /// </summary>
        /// <param name="model">The model<see cref="AccountsToPayContractEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutAccountsToPayContract(AccountsToPayContractDTO model)
        {
            try
            {                
                ValidateCompany(_AccountsToPayContractService.FindById(model.AccountsToPayContractId).CompayId);
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"AccountsToPayContractId", model.AccountsToPayContractId },
                    {"QuotaNumber", model.QuotaNumber },
                    {"Value", model.Value },
                    {"ExpirationDate", model.ExpirationDate },
                    {"AccountsStatusId", model.AccountsStatusId },
                    {"ContractId", model.ContractId },
                    {"CompayId", currentUserCompanyId }
                };

                response = await _AccountsToPayContractService.ExecStoreProcedure<AccountsToPayContractDTO>(parameters, spForUpdate);
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
        /// The DeleteAccountsToPayContract.
        /// </summary>
        /// <param name="model">The model<see cref="AccountsToPayContractEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{AccountsToPayContractId}")]
        public async Task<IActionResult> DeleteAccountsToPayContract(Int32? AccountsToPayContractId)
        {
            try
            {                
                ValidateCompany(_AccountsToPayContractService.FindById(AccountsToPayContractId).CompayId);

                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>(){
                        {"AccountsToPayContractId", AccountsToPayContractId }
                    };

                response = await _AccountsToPayContractService.ExecStoreProcedure<AccountsToPayContractDTO>(parameters, spForDelete);
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

