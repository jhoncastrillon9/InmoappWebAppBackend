namespace API.Controllers
{
    using Business.Properties;
    using Commons.DTOs.Properties;
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Http;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Extensions.Configuration;
    using Microsoft.Extensions.Logging;
    using System;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="PropertyStatusController" />.
    /// </summary>
    [Authorize(Roles = "SuperAdmin")]
    [Route("Properties/[controller]")]
    [ApiController]
    public class PropertyStatusController : BaseController
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly PropertyStatusService _PropertyStatusService;
        private readonly string spForRead = "Properties.PropertyStatus_READ";
        private readonly string spForList = "Properties.PropertyStatus_LIST";
        private readonly string spForCreate = "Properties.PropertyStatus_CREATE";
        private readonly string spForUpdate = "Properties.PropertyStatus_UPDATE";
        private readonly string spForDelete = "Properties.PropertyStatus_DELETE";

        /// <summary>
        /// Initializes a new instance of the <see cref="PropertyStatusController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public PropertyStatusController(PropertyStatusService propertyStatusService, ILogger<PropertyStatusController> logger, IHttpContextAccessor httpContext) : base(httpContext, logger)
        {
            _PropertyStatusService = propertyStatusService;
        }

        /// <summary>
        /// The GetPropertyStatus.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet]
        public async Task<IActionResult> GetPropertyStatus(Int32? PropertyStatusId, String PropertyStatusName)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"PropertyStatusId", PropertyStatusId },
                    {"PropertyStatusName", PropertyStatusName }
                };

                response = await _PropertyStatusService.ExecStoreProcedure<PropertyStatusDTO>(parameters, spForRead);

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
        /// The GetPropertyStatus.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListPropertyStatus(Int32? PropertyStatusId, String PropertyStatusName)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"PropertyStatusId", PropertyStatusId },
                    {"PropertyStatusName", PropertyStatusName }
                };

                response = await _PropertyStatusService.ExecStoreProcedure<PropertyStatusDTO>(parameters, spForList);

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
        /// The GetPropertyStatus.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{PropertyStatusId}")]
        public async Task<IActionResult> GetPropertyStatus(Int32 PropertyStatusId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"PropertyStatusId", PropertyStatusId },
                    {"PropertyStatusName", null }
                };

                response = await _PropertyStatusService.ExecStoreProcedure<PropertyStatusDTO>(parameters, spForRead);

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
        /// The PostPropertyStatus.
        /// </summary>
        /// <param name="model">The model<see cref="PropertyStatusEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostPropertyStatus(PropertyStatusDTO model)
        {
            try
            {
                

                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"PropertyStatusName", model.PropertyStatusName }
                };

                response = await _PropertyStatusService.ExecStoreProcedure<PropertyStatusDTO>(parameters, spForCreate);

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
        /// The PutPropertyStatus.
        /// </summary>
        /// <param name="model">The model<see cref="PropertyStatusEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutPropertyStatus(PropertyStatusDTO model)
        {
            try
            {
                

                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"PropertyStatusId", model.PropertyStatusId },
                    {"PropertyStatusName", model.PropertyStatusName }
                };

                response = await _PropertyStatusService.ExecStoreProcedure<PropertyStatusDTO>(parameters, spForUpdate);

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
        /// The DeletePropertyStatus.
        /// </summary>
        /// <param name="model">The model<see cref="PropertyStatusEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{PropertyStatusId}")]
        public async Task<IActionResult> DeletePropertyStatus(Int32? PropertyStatusId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"PropertyStatusId", PropertyStatusId }
                };

                response = await _PropertyStatusService.ExecStoreProcedure<PropertyStatusDTO>(parameters, spForDelete);

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

    }
}

