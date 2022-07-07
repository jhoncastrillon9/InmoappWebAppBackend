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
    /// Defines the <see cref="BankAccountController" />.
    /// </summary>
    [Authorize(Roles = "SuperAdmin,CompanyAdmin,FinanceUser")]
    [Route("Banks/[controller]")]
    [ApiController]
    public class BankAccountController : BaseController
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly BankAccountService _BankAccountService;
        private readonly string spForRead = "Banks.BankAccount_READ";
        private readonly string spForList = "Banks.BankAccount_LIST";
        private readonly string spForCreate = "Banks.BankAccount_CREATE";
        private readonly string spForUpdate = "Banks.BankAccount_UPDATE";
        private readonly string spForDelete = "Banks.BankAccount_DELETE";

        /// <summary>
        /// Initializes a new instance of the <see cref="BankAccountController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public BankAccountController(BankAccountService bankAccountService, ILogger<BankAccountController> logger, IHttpContextAccessor httpContext) : base(httpContext, logger)
        {
            _BankAccountService = bankAccountService;
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
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"BankAccountId", BankAccountId },
                    {"BankAccountName", BankAccountName },
                    {"CompayId", currentCompanyIdUser }
                };

                response = await _BankAccountService.ExecStoreProcedure<BankAccountDTO>(parameters, spForRead);

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
                return GenericExceptionHandling(ex);
            }


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
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"BankAccountId", BankAccountId },
                    {"BankAccountName", BankAccountName },
                    {"CompayId", currentCompanyIdUser }
                };

                response = await _BankAccountService.ExecStoreProcedure<BankAccountDTO>(parameters, spForList);

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
                return GenericExceptionHandling(ex);
            }

        }

        /// <summary>
        /// The GetBankAccount.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{BankAccountId}")]
        public async Task<IActionResult> GetBankAccount(Int32 BankAccountId)
        
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"BankAccountId", BankAccountId },
                    {"BankAccountName", null },
                    {"CompayId", currentCompanyIdUser }
                };

                response = await _BankAccountService.ExecStoreProcedure<BankAccountDTO>(parameters, spForRead);

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
                return GenericExceptionHandling(ex);
            }

        }

        /// <summary>
        /// The PostBankAccount.
        /// </summary>
        /// <param name="model">The model<see cref="BankAccountEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostBankAccount(BankAccountDTO model)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"BankAccountName", model.BankAccountName },
                    {"Total", model.Total },
                    {"CompayId", currentCompanyIdUser }
                };

                response = await _BankAccountService.ExecStoreProcedure<BankAccountDTO>(parameters, spForCreate);

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
                return GenericExceptionHandling(ex);
            }

        }

        /// <summary>
        /// The PutBankAccount.
        /// </summary>
        /// <param name="model">The model<see cref="BankAccountEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutBankAccount(BankAccountDTO model)
        {
            try
            {

                _BankAccountService.ValidateCompany(_BankAccountService.FindById(model.BankAccountId).CompayId);

                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"BankAccountId", model.BankAccountId },
                    {"BankAccountName", model.BankAccountName },
                    {"Total", model.Total },
                    {"CompayId", currentCompanyIdUser }
                };

                response = await _BankAccountService.ExecStoreProcedure<BankAccountDTO>(parameters, spForUpdate);

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
                return GenericExceptionHandling(ex);
            }

        }

        /// <summary>
        /// The DeleteBankAccount.
        /// </summary>
        /// <param name="model">The model<see cref="BankAccountEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{BankAccountId}")]
        public async Task<IActionResult> DeleteBankAccount(Int32? BankAccountId)
        {
            try
            {
                
                _BankAccountService.ValidateCompany(_BankAccountService.FindById(BankAccountId).CompayId);
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"BankAccountId", BankAccountId }
                };

                response = await _BankAccountService.ExecStoreProcedure<BankAccountDTO>(parameters, spForDelete);
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
                return GenericExceptionHandling(ex);
            }
        }

    }
}

