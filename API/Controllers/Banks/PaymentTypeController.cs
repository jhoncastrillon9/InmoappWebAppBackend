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
    /// Defines the <see cref="PaymentTypeController" />.
    /// </summary>
    [Authorize(Roles = "SuperAdmin,CompanyAdmin,FinanceUser")]
    [Route("Banks/[controller]")]
    [ApiController]
    public class PaymentTypeController : BaseController
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly PaymentTypeService _PaymentTypeService;
        private readonly string spForRead = "Banks.PaymentType_READ";
        private readonly string spForList = "Banks.PaymentTypes_LIST";
        private readonly string spForCreate = "Banks.PaymentType_CREATE";
        private readonly string spForUpdate = "Banks.PaymentType_UPDATE";
        private readonly string spForDelete = "Banks.PaymentType_DELETE";

        /// <summary>
        /// Initializes a new instance of the <see cref="PaymentTypeController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public PaymentTypeController(PaymentTypeService paymentTypeService, ILogger<PaymentTypeController> logger, IHttpContextAccessor httpContext) : base(httpContext, logger)
        {
            _PaymentTypeService = paymentTypeService;
        }

        /// <summary>
        /// The GetPaymentType.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet]
        public async Task<IActionResult> GetPaymentType(Int32? PaymentTypeId, String PaymentTypeName, Int32? CompayId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"PaymentTypeId", PaymentTypeId },
                    {"PaymentTypeName", PaymentTypeName },
                    {"CompayId", currentCompanyIdUser }
                };

                response = await _PaymentTypeService.ExecStoreProcedure<PaymentTypeDTO>(parameters, spForRead);
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
        /// The GetPaymentType.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListPaymentType(Int32? PaymentTypeId, String PaymentTypeName, Int32? CompayId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"PaymentTypeId", PaymentTypeId },
                {"PaymentTypeName", PaymentTypeName },
                {"CompayId", currentCompanyIdUser }
            };

                response = await _PaymentTypeService.ExecStoreProcedure<PaymentTypeDTO>(parameters, spForList);
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
        /// The GetPaymentType.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{PaymentTypeId}")]
        public async Task<IActionResult> GetPaymentType(Int32 PaymentTypeId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"PaymentTypeId", PaymentTypeId },
                {"PaymentTypeName", null },
                {"CompayId", currentCompanyIdUser }
            };

                response = await _PaymentTypeService.ExecStoreProcedure<PaymentTypeDTO>(parameters, spForRead);
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
        /// The PostPaymentType.
        /// </summary>
        /// <param name="model">The model<see cref="PaymentTypeEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostPaymentType(PaymentTypeDTO model)
        {
            try
            {
                

                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"PaymentTypeName", model.PaymentTypeName },
                {"CompayId", currentCompanyIdUser }
            };

                response = await _PaymentTypeService.ExecStoreProcedure<PaymentTypeDTO>(parameters, spForCreate);

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
        /// The PutPaymentType.
        /// </summary>
        /// <param name="model">The model<see cref="PaymentTypeEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutPaymentType(PaymentTypeDTO model)
        {
            try
            {

                _PaymentTypeService.ValidateCompany(_PaymentTypeService.FindById(model.PaymentTypeId).CompayId);

                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"PaymentTypeId", model.PaymentTypeId },
                    {"PaymentTypeName", model.PaymentTypeName },
                    {"CompayId", currentCompanyIdUser }
                };

                response = await _PaymentTypeService.ExecStoreProcedure<PaymentTypeDTO>(parameters, spForUpdate);

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
        /// The DeletePaymentType.
        /// </summary>
        /// <param name="model">The model<see cref="PaymentTypeEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{PaymentTypeId}")]
        public async Task<IActionResult> DeletePaymentType(Int32? PaymentTypeId)
        {
            try
            {
                
                _PaymentTypeService.ValidateCompany(_PaymentTypeService.FindById(PaymentTypeId).CompayId);
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"PaymentTypeId", PaymentTypeId }
                };

                response = await _PaymentTypeService.ExecStoreProcedure<PaymentTypeDTO>(parameters, spForDelete);

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

