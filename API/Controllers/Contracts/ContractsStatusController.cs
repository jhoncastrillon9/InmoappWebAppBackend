namespace API.Controllers
{
    using Business.Contracts;
    using Commons.DTOs.Contracts;
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
    /// Defines the <see cref="ContractsStatusController" />.
    /// </summary>
    [Authorize(Roles ="SuperAdmin")]
    [Route("Contracts/[controller]")]
    [ApiController]
    public class ContractsStatusController : BaseController
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly ContractsStatusService _ContractsStatusService;
        private readonly string spForRead = "Contracts.ContractsStatus_READ";
        private readonly string spForList = "Contracts.ContractsStatus_LIST";
        private readonly string spForCreate = "Contracts.ContractsStatus_CREATE";
        private readonly string spForUpdate = "Contracts.ContractsStatus_UPDATE";
        private readonly string spForDelete = "Contracts.ContractsStatus_DELETE";

        /// <summary>
        /// Initializes a new instance of the <see cref="ContractsStatusController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public ContractsStatusController(ContractsStatusService contractsStatusService, ILogger<ContractsStatusController> logger, IHttpContextAccessor httpContext) : base(httpContext, logger)
        {
            _ContractsStatusService = contractsStatusService;
        }

        /// <summary>
        /// The GetContractsStatus.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet]
        public async Task<IActionResult> GetContractsStatus(Int32? ContractsStatusId, String ContractsStatusName)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"ContractsStatusId", ContractsStatusId },
                    {"ContractsStatusName", ContractsStatusName }
                };

                response = await _ContractsStatusService.ExecStoreProcedure<ContractsStatusDTO>(parameters, spForRead);

                return new OkObjectResult(response);

            }
            catch (ApplicationException ex)
            {
                base.response.ExecutionError = true;
                base.response.Message = ex.Message;
                return new BadRequestObjectResult(base.response);
            }
            catch (Exception ex)
            {
                base.response.ExecutionError = true;
                return new BadRequestObjectResult(base.response);
            }


        }

        /// <summary>
        /// The GetContractsStatus.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListContractsStatus(Int32? ContractsStatusId, String ContractsStatusName)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"ContractsStatusId", ContractsStatusId },
                    {"ContractsStatusName", ContractsStatusName }
                };

                response = await _ContractsStatusService.ExecStoreProcedure<ContractsStatusDTO>(parameters, spForList);
               
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
                response.ExecutionError = true;
                return new BadRequestObjectResult(response);
            }

        }

        /// <summary>
        /// The GetContractsStatus.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{ContractsStatusId}")]
        public async Task<IActionResult> GetContractsStatus(Int32 ContractsStatusId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"ContractsStatusId", ContractsStatusId },
                {"ContractsStatusName", null }
            };

                response = await _ContractsStatusService.ExecStoreProcedure<ContractsStatusDTO>(parameters, spForRead);
 
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
                response.ExecutionError = true;
                return new BadRequestObjectResult(response);
            }

        }

        /// <summary>
        /// The PostContractsStatus.
        /// </summary>
        /// <param name="model">The model<see cref="ContractsStatusEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostContractsStatus(ContractsStatusDTO model)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"ContractsStatusName", model.ContractsStatusName }
                };

                response = await _ContractsStatusService.ExecStoreProcedure<ContractsStatusDTO>(parameters, spForCreate);

                return new OkObjectResult(response);

            }
            catch (ApplicationException ex)
            {
                base.response.ExecutionError = true;
                base.response.Message = ex.Message;
                return new BadRequestObjectResult(base.response);
            }
            catch (Exception ex)
            {
                base.response.ExecutionError = true;
                return new BadRequestObjectResult(base.response);
            }

        }

        /// <summary>
        /// The PutContractsStatus.
        /// </summary>
        /// <param name="model">The model<see cref="ContractsStatusEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutContractsStatus(ContractsStatusDTO model)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"ContractsStatusId", model.ContractsStatusId },
                    {"ContractsStatusName", model.ContractsStatusName }
                };

                response = await _ContractsStatusService.ExecStoreProcedure<ContractsStatusDTO>(parameters, spForUpdate);

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
                response.ExecutionError = true;
                return new BadRequestObjectResult(response);
            }

        }


        /// <summary>
        /// The DeleteContractsStatus.
        /// </summary>
        /// <param name="model">The model<see cref="ContractsStatusEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{ContractsStatusId}")]
        public async Task<IActionResult> DeleteContractsStatus(Int32? ContractsStatusId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"ContractsStatusId", ContractsStatusId }
                };

                var result = await _ContractsStatusService.ExecStoreProcedure<ContractsStatusDTO>(parameters, spForDelete);

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

