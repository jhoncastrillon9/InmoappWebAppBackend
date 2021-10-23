namespace API.Controllers
{
    using Business.Banks;
    using Commons.DTOs.Banks;
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Http;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Extensions.Configuration;
    using Microsoft.Extensions.Logging;
    using System;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="AccountsStatusController" />.
    /// </summary>
   [Authorize(Roles = "SuperAdmin")]
    [Route("Banks/[controller]")]
    [ApiController]
    public class AccountsStatusController : BaseController
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly AccountsStatusService _accountsStatusService;
        private readonly string spForRead = "Banks.AccountsStatus_READ";
        private readonly string spForList = "Banks.AccountsStatus_LIST";
        private readonly string spForCreate = "Banks.AccountsStatus_CREATE";
        private readonly string spForUpdate = "Banks.AccountsStatus_UPDATE";
        private readonly string spForDelete = "Banks.AccountsStatus_DELETE";



        /// <summary>
        /// Initializes a new instance of the <see cref="AccountsStatusController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public AccountsStatusController(AccountsStatusService accountsStatusService, ILogger<AccountsStatusController> logger, IHttpContextAccessor httpContext) : base(httpContext, logger)
        {
            _accountsStatusService = accountsStatusService; 
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
            try
            {                
                _accountsStatusService.LoadUserSessionservice();
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"AccountsStatusId", AccountsStatusId },
                    {"AccountsStatusName", AccountsStatusName }
                };

                response = await _accountsStatusService.ExecStoreProcedure<AccountsStatusDTO>(parameters, spForRead);

                return new OkObjectResult(response);
            }
            catch (ApplicationException ex)
            {
                response.ExecutionError = true;
                response.Message = ex.Message;
                return new BadRequestObjectResult(response);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex,ex.Message);
                response.ExecutionError = true;
                return new BadRequestObjectResult(response);
            }

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
            _accountsStatusService.LoadUserSessionservice();
            try
            {
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"AccountsStatusId", AccountsStatusId },
                    {"AccountsStatusName", AccountsStatusName }
                };

                response = await _accountsStatusService.ExecStoreProcedure<AccountsStatusDTO>(parameters, spForList);

                return new OkObjectResult(response);
            }
            catch (ApplicationException ex)
            {
                response.Message = ex.Message;
                return new BadRequestObjectResult(response);
            }
            catch (Exception ex)
            {
                return new BadRequestObjectResult(response);
            }

        }

        /// <summary>
        /// The GetAccountsStatus.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{AccountsStatusId}")]
        public async Task<IActionResult> GetAccountsStatus(Int32 AccountsStatusId)
        {

            try
            {

                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"AccountsStatusId", AccountsStatusId },
                    {"AccountsStatusName", null }
                };

                response = await _accountsStatusService.ExecStoreProcedure<AccountsStatusDTO>(parameters, spForRead);

                return new OkObjectResult(response);
            }
            catch (ApplicationException ex)
            {
                response.Message = ex.Message;
                return new BadRequestObjectResult(response);
            }
            catch (Exception ex)
            {
                return new BadRequestObjectResult(response);
            }
        }

        /// <summary>
        /// The PostAccountsStatus.
        /// </summary>
        /// <param name="model">The model<see cref="AccountsStatusEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostAccountsStatus(AccountsStatusDTO model)
        {
            try
            {
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"AccountsStatusName", model.AccountsStatusName }

                };

                response = await _accountsStatusService.ExecStoreProcedure<AccountsStatusDTO>(parameters, spForCreate);

                return new OkObjectResult(response);
            }
            catch (ApplicationException ex)
            {
                response.Message = ex.Message;
                return new BadRequestObjectResult(response);
            }
            catch (Exception ex)
            {
                return new BadRequestObjectResult(response);
            }

        }



        /// <summary>
        /// The PutAccountsStatus.
        /// </summary>
        /// <param name="model">The model<see cref="AccountsStatusEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutAccountsStatus(AccountsStatusDTO model)
        {
            try
            {

                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"AccountsStatusId", model.AccountsStatusId },
                    {"AccountsStatusName", model.AccountsStatusName }
                    //{"UpdatedBy", userIdSession }
                };

                response = await _accountsStatusService.ExecStoreProcedure<AccountsStatusDTO>(parameters, spForUpdate);

                return new OkObjectResult(response);
            }
            catch (ApplicationException ex)
            {
                response.Message = ex.Message;
                return new BadRequestObjectResult(response);
            }
            catch (Exception ex)
            {
                return new BadRequestObjectResult(response);
            }

        }



        /// <summary>
        /// The DeleteAccountsStatus.
        /// </summary>
        /// <param name="model">The model<see cref="AccountsStatusEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{AccountsStatusId}")]
        public async Task<IActionResult> DeleteAccountsStatus(Int32? AccountsStatusId)
        {
            try
            {
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"AccountsStatusId", AccountsStatusId }
                };

                response = await _accountsStatusService.ExecStoreProcedure<AccountsStatusDTO>(parameters, spForDelete);

                return new OkObjectResult(response);
            }
            catch (ApplicationException ex)
            {
                response.Message = ex.Message;
                return new BadRequestObjectResult(response);
            }
            catch (Exception ex)
            {
                return new BadRequestObjectResult(response);
            }
        }

    }
}

