using Business.Commons;
using Commons.DTOs.Commons;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API.Controllers
{
    /// <summary>
    /// Defines the <see cref="CityController" />.
    /// </summary>
    [Authorize(Roles = "SuperAdmin")]
    // [AuthorizeAttribute(typeof(AuthorizeRoleAttribute), Arguments = new object[] { 10 })]
    [Route("Commons/[controller]")]
    [ApiController]
    public class CityController : BaseController
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly CityService _CityService;
        private readonly string spForRead = "Commons.City_READ";
        private readonly string spForList = "Commons.City_LIST";
        private readonly string spForCreate = "Commons.City_CREATE";
        private readonly string spForUpdate = "Commons.City_UPDATE";
        private readonly string spForDelete = "Commons.City_DELETE";

        /// <summary>
        /// Initializes a new instance of the <see cref="CityController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public CityController(CityService cityService, IHttpContextAccessor httpContext) : base(httpContext)
        {
            _CityService = cityService;
        }

        /// <summary>
        /// The GetCity.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet]
        public async Task<IActionResult> GetCity(Int32? CityId, String CityName, Int32? StateId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"CityId", CityId },
                {"CityName", CityName },
                {"StateId", StateId }
            };

                var result = await _CityService.ExecStoreProcedure<CityDTO>(parameters, spForRead);
                return new OkObjectResult(result);

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
        /// The GetCity.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListCity(Int32? CityId, String CityName, Int32? StateId)
        {

            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"CityId", CityId },
                {"CityName", CityName },
                {"StateId", StateId }
            };

                var result = await _CityService.ExecStoreProcedure<CityDTO>(parameters, spForList);
                return new OkObjectResult(result);

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
        /// The GetCity.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{CityId}")]
        public async Task<IActionResult> GetCity(Int32 CityId)
        {

            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"CityId", CityId },
                {"CityName", null },
                {"StateId", null }
            };

                var result = await _CityService.ExecStoreProcedure<CityDTO>(parameters, spForRead);
                return new OkObjectResult(result);

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
        /// The PostCity.
        /// </summary>
        /// <param name="model">The model<see cref="CityEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostCity(CityDTO model)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"CityName", model.CityName },
                {"StateId", model.StateId }
            };

                var result = await _CityService.ExecStoreProcedure<CityDTO>(parameters, spForCreate);
                return new OkObjectResult(result);

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
        /// The PutCity.
        /// </summary>
        /// <param name="model">The model<see cref="CityEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutCity(CityDTO model)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"CityId", model.CityId },
                {"CityName", model.CityName },
                {"StateId", model.StateId }
            };

                var result = await _CityService.ExecStoreProcedure<CityDTO>(parameters, spForUpdate);
                return new OkObjectResult(result);

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
        /// The DeleteCity.
        /// </summary>
        /// <param name="model">The model<see cref="CityEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{CityId}")]
        public async Task<IActionResult> DeleteCity(Int32? CityId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"CityId", CityId }
            };

                var result = await _CityService.ExecStoreProcedure<CityDTO>(parameters, spForDelete);
                return new OkObjectResult(result);

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

