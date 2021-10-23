namespace API.Controllers
{
    using Business.Contracts;
    using Business.Tenants;
    using Commons.DTOs.Contracts;
    using Commons.Enums.Users;
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Http;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Extensions.Configuration;
    using Microsoft.Extensions.Logging;
    using System;
    using System.Collections.Generic;
    using System.Security.Claims;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="TenantsByContractController" />.
    /// </summary>
    [Authorize(Roles = "Superadmin")]
    [Route("Contracts/[controller]")]
    [ApiController]
    public class TenantsByContractController : BaseController
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly TenantsByContractService _TenantsByContractService;
        private readonly TenantService _TenantService;
        private readonly string spForRead = "Contracts.TenantsByContract_READ";
        private readonly string spForList = "Contracts.TenantsByContract_LIST";
        private readonly string spForCreate = "Contracts.TenantsByContract_CREATE";
        private readonly string spForUpdate = "Contracts.TenantsByContract_UPDATE";
        private readonly string spForDelete = "Contracts.TenantsByContract_DELETE";

        /// <summary>
        /// Initializes a new instance of the <see cref="TenantsByContractController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public TenantsByContractController(TenantsByContractService tenantsByContractService, TenantService tenantService, ILogger<TenantsByContractService> logger, IHttpContextAccessor httpContext) : base(httpContext, logger)
        {
            _TenantsByContractService = tenantsByContractService;
            _TenantService = tenantService;
        }

        /// <summary>
        /// The GetTenantsByContract.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet]
        public async Task<IActionResult> GetTenantsByContract(Int32? TenantsByContractId, Int32? TenantId, String Profile)
        {
            try
            {              

                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"TenantsByContractId", TenantsByContractId },
                    {"TenantId", TenantId },
                    {"Profile", Profile }
                };

                response = await _TenantsByContractService.ExecStoreProcedure<TenantsByContractDTO>(parameters, spForRead);
              
                return new OkObjectResult(response);
            }
            catch (ApplicationException ex)
            {
                response.ExecutionError = true;
                response.Message = ex.Message;
                return new BadRequestObjectResult(base.response);
            }
            catch (Exception ex)
            {
                return GenericExceptionHandling(ex);
            }


        }

        /// <summary>
        /// The GetTenantsByContract.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListTenantsByContract(Int32? TenantsByContractId, Int32? TenantId, String Profile)
        {
            try
            {
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"TenantsByContractId", TenantsByContractId },
                    {"TenantId", TenantId },
                    {"Profile", Profile }
                };

                var result = await _TenantsByContractService.ExecStoreProcedure<TenantsByContractDTO>(parameters, spForList);
                if (result.ExecutionError)
                {
                    return new BadRequestObjectResult(result);
                }
                return new OkObjectResult(result);
            }
            catch (ApplicationException ex)
            {
                response.ExecutionError = true;
                response.Message = ex.Message;
                return new BadRequestObjectResult(base.response);
            }
            catch (Exception ex)
            {
                return GenericExceptionHandling(ex);
            }

        }

        /// <summary>
        /// The GetTenantsByContract.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{TenantsByContractId}")]
        public async Task<IActionResult> GetTenantsByContract(Int32 TenantsByContractId)
        {
            try
            {
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"TenantsByContractId", TenantsByContractId },
                    {"TenantId", null },
                    {"Profile", null }
                };

                var result = await _TenantsByContractService.ExecStoreProcedure<TenantsByContractDTO>(parameters, spForRead);

                return new OkObjectResult(result);
            }
            catch (ApplicationException ex)
            {
                response.ExecutionError = true;
                response.Message = ex.Message;
                return new BadRequestObjectResult(base.response);
            }
            catch (Exception ex)
            {
                return GenericExceptionHandling(ex);
            }

        }

        /// <summary>
        /// The PostTenantsByContract.
        /// </summary>
        /// <param name="model">The model<see cref="TenantsByContractEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostTenantsByContract(TenantsByContractDTO model)
        {
            try
            {              

                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"TenantId", model.TenantId },
                    {"Profile", model.Profile }
                };

                var result = await _TenantsByContractService.ExecStoreProcedure<TenantsByContractDTO>(parameters, spForCreate);
                if (result.ExecutionError)
                {
                    return new BadRequestObjectResult(result);
                }
                return new OkObjectResult(result);
            }
            catch (ApplicationException ex)
            {
                response.ExecutionError = true;
                response.Message = ex.Message;
                return new BadRequestObjectResult(base.response);
            }
            catch (Exception ex)
            {
                return GenericExceptionHandling(ex);
            }

        }

        /// <summary>
        /// The PutTenantsByContract.
        /// </summary>
        /// <param name="model">The model<see cref="TenantsByContractEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutTenantsByContract(TenantsByContractDTO model)
        {
            try
            {

                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"TenantsByContractId", model.TenantsByContractId },
                    {"TenantId", model.TenantId },
                    {"Profile", model.Profile }
                };

                var result = await _TenantsByContractService.ExecStoreProcedure<TenantsByContractDTO>(parameters, spForUpdate);

                return new OkObjectResult(result);
            }
            catch (ApplicationException ex)
            {
                response.ExecutionError = true;
                response.Message = ex.Message;
                return new BadRequestObjectResult(base.response);
            }
            catch (Exception ex)
            {
                return GenericExceptionHandling(ex);
            }  
        }

        /// <summary>
        /// The DeleteTenantsByContract.
        /// </summary>
        /// <param name="model">The model<see cref="TenantsByContractEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{TenantsByContractId}")]
        public async Task<IActionResult> DeleteTenantsByContract(Int32? TenantsByContractId)
        {
            try
            {
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"TenantsByContractId", TenantsByContractId }
                };

                var result = await _TenantsByContractService.ExecStoreProcedure<TenantsByContractDTO>(parameters, spForDelete);
               
                return new OkObjectResult(result);
            }
            catch (ApplicationException ex)
            {
                response.ExecutionError = true;
                response.Message = ex.Message;
                return new BadRequestObjectResult(base.response);
            }
            catch (Exception ex)
            {
                return GenericExceptionHandling(ex);
            }
            
        }

    }
}

