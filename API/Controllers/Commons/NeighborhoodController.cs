namespace API.Controllers
{
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Extensions.Configuration;
    using System;
    using System.Collections.Generic;
    using System.Security.Claims;
    using System.Threading.Tasks;

    using Business.Commons;
    using Entities.Commons;
    using Commons.DTOs.Commons;

    /// <summary>
    /// Defines the <see cref="NeighborhoodController" />.
    /// </summary>
    [Authorize]
    [Route("Commons/[controller]")]
    [ApiController]
    public class NeighborhoodController: ControllerBase
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly NeighborhoodService business;        
        private string spForRead = "Commons.Neighborhood_READ";
        private string spForList = "Commons.Neighborhood_LIST";
        private string spForCreate = "Commons.Neighborhood_CREATE";
        private string spForUpdate = "Commons.Neighborhood_UPDATE";
        private string spForDelete = "Commons.Neighborhood_DELETE";

        /// <summary>
        /// Initializes a new instance of the <see cref="NeighborhoodController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public NeighborhoodController(NeighborhoodService neighborhoodService)
        {
            business = neighborhoodService;
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
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"NeighborhoodId", NeighborhoodId },
				{"NeighborhoodName", NeighborhoodName },
				{"ZoneId", ZoneId }
            };

            var result = await business.ExecStoreProcedure<NeighborhoodDTO>(parameters, spForRead);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
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
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"NeighborhoodId", NeighborhoodId },
				{"NeighborhoodName", NeighborhoodName },
				{"ZoneId", ZoneId }
            };

            var result = await business.ExecStoreProcedure<NeighborhoodDTO>(parameters, spForList);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetNeighborhood.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{NeighborhoodId}")]
        public async Task<IActionResult> GetNeighborhood(Int32 NeighborhoodId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"NeighborhoodId", NeighborhoodId },
				{"NeighborhoodName", null },
				{"ZoneId", null }
            };

            var result = await business.ExecStoreProcedure<NeighborhoodDTO>(parameters, spForRead);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PostNeighborhood.
        /// </summary>
        /// <param name="model">The model<see cref="NeighborhoodEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostNeighborhood(NeighborhoodEntity model)
        {
            Int32 CreatedBy = 0;
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            if (identity != null)
            {
                CreatedBy = Int32.Parse(identity.FindFirst("userId").Value);
            }

            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"NeighborhoodName", model.NeighborhoodName },
				{"ZoneId", model.ZoneId }
            };

            var result = await business.ExecStoreProcedure<NeighborhoodDTO>(parameters, spForCreate);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PutNeighborhood.
        /// </summary>
        /// <param name="model">The model<see cref="NeighborhoodEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutNeighborhood(NeighborhoodEntity model)
        {
            Int32 UpdatedBy = 0;
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            if (identity != null)
            {
                UpdatedBy = Int32.Parse(identity.FindFirst("userId").Value);
            }

            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"NeighborhoodId", model.NeighborhoodId },
				{"NeighborhoodName", model.NeighborhoodName },
				{"ZoneId", model.ZoneId }
            };

            var result = await business.ExecStoreProcedure<NeighborhoodDTO>(parameters, spForUpdate);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }


        /// <summary>
        /// The DeleteNeighborhood.
        /// </summary>
        /// <param name="model">The model<see cref="NeighborhoodEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{NeighborhoodId}")]
        public async Task<IActionResult> DeleteNeighborhood(Int32? NeighborhoodId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"NeighborhoodId", NeighborhoodId }
            };

            var result = await business.ExecStoreProcedure<NeighborhoodDTO>(parameters, spForDelete);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

    }
}

