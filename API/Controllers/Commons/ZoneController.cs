namespace API.Controllers
{
    using Business.Commons;
    using Commons.DTOs.Commons;
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Http;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Extensions.Configuration;
    using Microsoft.Extensions.Logging;
    using System;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="ZoneController" />.
    /// </summary>
    [Route("Commons/[controller]")]
    [ApiController]
    public class ZoneController : BaseController
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly ZoneService ZoneService;

        private readonly string spForRead = "Commons.Zone_READ";
        private readonly string spForList = "Commons.Zone_LIST";
        private readonly string spForCreate = "Commons.Zone_CREATE";
        private readonly string spForUpdate = "Commons.Zone_UPDATE";
        private readonly string spForDelete = "Commons.Zone_DELETE";


        /// <summary>
        /// Initializes a new instance of the <see cref="ZoneController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public ZoneController(ZoneService zoneService, ILogger<ZoneController> logger, IHttpContextAccessor httpContext) : base(httpContext, logger)
        {
            ZoneService = zoneService;
        }

        /// <summary>
        /// The GetZone.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [Authorize(Roles = "SuperAdmin,CompanyAdmin,PropertyUser")]
        [HttpGet]
        public async Task<IActionResult> GetZone(Int32? ZoneId, String ZoneName, Int32? CityId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"ZoneId", ZoneId },
                    {"ZoneName", ZoneName },
                    {"CityId", CityId }
                };

                var result = await ZoneService.ExecStoreProcedure<ZoneDTO>(parameters, spForRead);

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
                return GenericExceptionHandling(ex);
            }

        }

        /// <summary>
        /// The GetZone.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [Authorize(Roles = "SuperAdmin,CompanyAdmin,PropertyUser")]
        [HttpGet("list")]
        public async Task<IActionResult> GetListZone(Int32? ZoneId, String ZoneName, Int32? CityId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"ZoneId", ZoneId },
                {"ZoneName", ZoneName },
                {"CityId", CityId }
            };

                response = await ZoneService.ExecStoreProcedure<ZoneDTO>(parameters, spForList);

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
        /// The GetZone.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [Authorize(Roles = "SuperAdmin,CompanyAdmin,PropertyUser")]
        [HttpGet("{ZoneId}")]
        public async Task<IActionResult> GetZone(Int32 ZoneId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"ZoneId", ZoneId },
                {"ZoneName", null },
                {"CityId", null }
            };

                response = await ZoneService.ExecStoreProcedure<ZoneDTO>(parameters, spForRead);

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
        /// The PostEntity.
        /// </summary>
        /// <param name="model">The model<see cref="ZoneEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [Authorize(Roles = "SuperAdmin")]
        [HttpPost]
        public async Task<IActionResult> PostZone(ZoneDTO model)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"ZoneName", model.ZoneName },
                {"CityId", model.CityId }
            };

                response = await ZoneService.ExecStoreProcedure<ZoneDTO>(parameters, spForCreate);

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
        /// The PutZone.
        /// </summary>
        /// <param name="model">The model<see cref="ZoneEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [Authorize(Roles = "SuperAdmin")]
        [HttpPut]
        public async Task<IActionResult> PutZone(ZoneDTO model)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"ZoneId", model.ZoneId },
                {"ZoneName", model.ZoneName },
                {"CityId", model.CityId }
            };

                response = await ZoneService.ExecStoreProcedure<ZoneDTO>(parameters, spForUpdate);

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
        /// The DeleteZone.
        /// </summary>
        /// <param name="model">The model<see cref="ZoneEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [Authorize(Roles = "SuperAdmin")]
        [HttpDelete("{ZoneId}")]
        public async Task<IActionResult> DeleteZone(Int32? ZoneId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"ZoneId", ZoneId }
            };

                response = await ZoneService.ExecStoreProcedure<ZoneDTO>(parameters, spForDelete);

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

