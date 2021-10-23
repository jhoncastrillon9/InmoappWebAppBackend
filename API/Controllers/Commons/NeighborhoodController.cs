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
    using System.Security.Claims;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="NeighborhoodController" />.
    /// </summary>
    [Authorize(Roles = "SuperAdmin")]
    [Route("Commons/[controller]")]
    [ApiController]
    public class NeighborhoodController : BaseController
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly NeighborhoodService _NeighborhoodService;
        private readonly string spForRead = "Commons.Neighborhood_READ";
        private readonly string spForList = "Commons.Neighborhood_LIST";
        private readonly string spForCreate = "Commons.Neighborhood_CREATE";
        private readonly string spForUpdate = "Commons.Neighborhood_UPDATE";
        private readonly string spForDelete = "Commons.Neighborhood_DELETE";

        /// <summary>
        /// Initializes a new instance of the <see cref="NeighborhoodController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public NeighborhoodController(NeighborhoodService neighborhoodService, ILogger<NeighborhoodController> logger, IHttpContextAccessor httpContext) : base(httpContext, logger)
        {
            _NeighborhoodService = neighborhoodService;
        }

        /// <summary>
        /// The GetNeighborhood.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet]
        public async Task<IActionResult> GetNeighborhood(Int32? NeighborhoodId, String NeighborhoodName, Int32? ZoneId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"NeighborhoodId", NeighborhoodId },
                {"NeighborhoodName", NeighborhoodName },
                {"ZoneId", ZoneId }
            };

                response = await _NeighborhoodService.ExecStoreProcedure<NeighborhoodDTO>(parameters, spForRead);
                
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
        /// The GetNeighborhood.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListNeighborhood(Int32? NeighborhoodId, String NeighborhoodName, Int32? ZoneId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"NeighborhoodId", NeighborhoodId },
                {"NeighborhoodName", NeighborhoodName },
                {"ZoneId", ZoneId }
            };

                response = await _NeighborhoodService.ExecStoreProcedure<NeighborhoodDTO>(parameters, spForList);
              
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
        /// The GetNeighborhood.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{NeighborhoodId}")]
        public async Task<IActionResult> GetNeighborhood(Int32 NeighborhoodId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"NeighborhoodId", NeighborhoodId },
                {"NeighborhoodName", null },
                {"ZoneId", null }
            };

                response = await _NeighborhoodService.ExecStoreProcedure<NeighborhoodDTO>(parameters, spForRead);
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
        /// The PostNeighborhood.
        /// </summary>
        /// <param name="model">The model<see cref="NeighborhoodEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostNeighborhood(NeighborhoodDTO model)
        {
            try
            {
                


                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"NeighborhoodName", model.NeighborhoodName },
                {"ZoneId", model.ZoneId }
            };

                response = await _NeighborhoodService.ExecStoreProcedure<NeighborhoodDTO>(parameters, spForCreate);
              
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
        /// The PutNeighborhood.
        /// </summary>
        /// <param name="model">The model<see cref="NeighborhoodEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutNeighborhood(NeighborhoodDTO model)
        {
            try
            {
                

                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"NeighborhoodId", model.NeighborhoodId },
                {"NeighborhoodName", model.NeighborhoodName },
                {"ZoneId", model.ZoneId }
            };

                response = await _NeighborhoodService.ExecStoreProcedure<NeighborhoodDTO>(parameters, spForUpdate);
              
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
        /// The DeleteNeighborhood.
        /// </summary>
        /// <param name="model">The model<see cref="NeighborhoodEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{NeighborhoodId}")]
        public async Task<IActionResult> DeleteNeighborhood(Int32? NeighborhoodId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"NeighborhoodId", NeighborhoodId }
                };

                response = await _NeighborhoodService.ExecStoreProcedure<NeighborhoodDTO>(parameters, spForDelete);
               
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

