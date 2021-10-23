using Business.Banks;
using Commons.DTOs.Banks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;

namespace API.Controllers
{
    /// <summary>
    /// Defines the <see cref="HistoryBankAccountController" />.
    /// </summary>
    [Authorize(Roles = "SuperAdmin,CompanyAdmin,FinanceUser")]
    [Route("Banks/[controller]")]
    [ApiController]
    public class HistoryBankAccountController : BaseController
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly HistoryBankAccountService _HistoryBankAccountServie;
        private readonly string spForRead = "Banks.HistoryBankAccount_READ";
        private readonly string spForList = "Banks.HistoryBankAccount_LIST";
        private readonly string spForCreate = "Banks.HistoryBankAccount_CREATE";
        private readonly string spForUpdate = "Banks.HistoryBankAccount_UPDATE";
        private readonly string spForDelete = "Banks.HistoryBankAccount_DELETE";

        /// <summary>
        /// Initializes a new instance of the <see cref="HistoryBankAccountController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public HistoryBankAccountController(HistoryBankAccountService historyBankAccountService, ILogger<HistoryBankAccountController> logger, IHttpContextAccessor httpContext) : base(httpContext, logger)
        {
            _HistoryBankAccountServie = historyBankAccountService;
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
            try
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
                    {"CompayId", currentCompanyIdUser }
                };

                var result = await _HistoryBankAccountServie.ExecStoreProcedure<HistoryBankAccountDTO>(parameters, spForRead);

                return new OkObjectResult(result);

            }
            catch (ApplicationException ex)
            {
                response.ExecutionError = true;
                response.Message = ex.Message;
                return new BadRequestObjectResult(response);
            }
            catch (Exception ex)
            {
                response.ExecutionError = true;
                return new BadRequestObjectResult(response);
            }

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
            try
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
                {"CompayId", currentCompanyIdUser }
            };

                var result = await _HistoryBankAccountServie.ExecStoreProcedure<HistoryBankAccountDTO>(parameters, spForList);

                return new OkObjectResult(result);

            }
            catch (ApplicationException ex)
            {
                response.ExecutionError = true;
                response.Message = ex.Message;
                return new BadRequestObjectResult(response);
            }
            catch (Exception ex)
            {
                response.ExecutionError = true;
                return new BadRequestObjectResult(response);
            }

        }

        /// <summary>
        /// The GetHistoryBankAccount.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{HistoryBankAccountId}")]
        public async Task<IActionResult> GetHistoryBankAccount(Int32 HistoryBankAccountId)
        {
            try
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
                {"CompayId", currentCompanyIdUser }
            };

                var result = await _HistoryBankAccountServie.ExecStoreProcedure<HistoryBankAccountDTO>(parameters, spForRead);

                return new OkObjectResult(result);

            }
            catch (ApplicationException ex)
            {
                response.ExecutionError = true;
                response.Message = ex.Message;
                return new BadRequestObjectResult(response);
            }
            catch (Exception ex)
            {
                response.ExecutionError = true;
                return new BadRequestObjectResult(response);
            }

        }

        /// <summary>
        /// The PostHistoryBankAccount.
        /// </summary>
        /// <param name="model">The model<see cref="HistoryBankAccountEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostHistoryBankAccount(HistoryBankAccountDTO model)
        {
            try
            {
                

                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"PaymentTypeId", model.PaymentTypeId },
                {"Value", model.Value },
                {"BankAccountId", model.BankAccountId },
                {"AccountsToPayContractsId", model.AccountsToPayContractsId },
                {"AccountsToReceivableContractsId", model.AccountsToReceivableContractsId },
                {"Obervation", model.Obervation },
                {"CompayId", currentCompanyIdUser }
            };

                var result = await _HistoryBankAccountServie.ExecStoreProcedure<HistoryBankAccountDTO>(parameters, spForCreate);

                return new OkObjectResult(result);

            }
            catch (ApplicationException ex)
            {
                response.ExecutionError = true;
                response.Message = ex.Message;
                return new BadRequestObjectResult(response);
            }
            catch (Exception ex)
            {
                response.ExecutionError = true;
                return new BadRequestObjectResult(response);
            }

        }

        /// <summary>
        /// The PutHistoryBankAccount.
        /// </summary>
        /// <param name="model">The model<see cref="HistoryBankAccountEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutHistoryBankAccount(HistoryBankAccountDTO model)
        {
            try
            {

                _HistoryBankAccountServie.ValidateCompany(_HistoryBankAccountServie.FindById(model.HistoryBankAccountId).CompayId);
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
                {"CompayId", currentCompanyIdUser }
            };

                var result = await _HistoryBankAccountServie.ExecStoreProcedure<HistoryBankAccountDTO>(parameters, spForUpdate);

                return new OkObjectResult(result);

            }
            catch (ApplicationException ex)
            {
                response.ExecutionError = true;
                response.Message = ex.Message;
                return new BadRequestObjectResult(response);
            }
            catch (Exception ex)
            {
                response.ExecutionError = true;
                return new BadRequestObjectResult(response);
            }
        }

        /// <summary>
        /// The DeleteHistoryBankAccount.
        /// </summary>
        /// <param name="model">The model<see cref="HistoryBankAccountEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{HistoryBankAccountId}")]
        public async Task<IActionResult> DeleteHistoryBankAccount(Int32? HistoryBankAccountId)
        {
            try
            {
                
                _HistoryBankAccountServie.ValidateCompany(_HistoryBankAccountServie.FindById(HistoryBankAccountId).CompayId);

                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                    {
                        {"HistoryBankAccountId", HistoryBankAccountId }
                    };

                var result = await _HistoryBankAccountServie.ExecStoreProcedure<HistoryBankAccountDTO>(parameters, spForDelete);

                return new OkObjectResult(result);
            }
            catch (ApplicationException ex)
            {
                response.ExecutionError = true;
                response.Message = ex.Message;
                return new BadRequestObjectResult(response);
            }
            catch (Exception ex)
            {
                response.ExecutionError = true;
                return new BadRequestObjectResult(response);
            }

        }

    }
}

