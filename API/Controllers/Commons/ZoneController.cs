namespace API.Controllers
{
    using Business.Commons;
    using Commons.DTOs.Commons;
    using Entities.Commons;
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Extensions.Configuration;
    using System;
    using System.Collections.Generic;
    using System.Security.Claims;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="ZoneController" />.
    /// </summary>
    [Authorize]
    [Route("Commons/[controller]")]
    [ApiController]
    public class ZoneController : ControllerBase
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly ZoneService business;

        private string spForRead = "Commons.Zone_READ";
        private string spForList = "Commons.Zone_LIST";
        private string spForCreate = "Commons.Zone_CREATE";
        private string spForUpdate = "Commons.Zone_UPDATE";
        private string spForDelete = "Commons.Zone_DELETE";


        /// <summary>
        /// Initializes a new instance of the <see cref="ZoneController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public ZoneController(ZoneService zoneService)
        {
            business = zoneService;
        }

        /// <summary>
        /// The GetZone.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet]
        public async Task<IActionResult> GetZone(Int32? ZoneId, String ZoneName, Int32? CityId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"ZoneId", ZoneId },
                {"ZoneName", ZoneName },
                {"CityId", CityId }
            };

            var result = await business.ExecStoreProcedure<ZoneDTO>(parameters, spForRead);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetZone.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListZone(Int32? ZoneId, String ZoneName, Int32? CityId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"ZoneId", ZoneId },
                {"ZoneName", ZoneName },
                {"CityId", CityId }
            };

            var result = await business.ExecStoreProcedure<ZoneDTO>(parameters, spForList);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetZone.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{ZoneId}")]
        public async Task<IActionResult> GetZone(Int32 ZoneId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"ZoneId", ZoneId },
                {"ZoneName", null },
                {"CityId", null }
            };

            var result = await business.ExecStoreProcedure<ZoneDTO>(parameters, spForRead);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PostEntity.
        /// </summary>
        /// <param name="model">The model<see cref="ZoneEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostZone(ZoneEntity model)
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
                {"ZoneName", model.ZoneName },
                {"CityId", model.CityId }
            };

            var result = await business.ExecStoreProcedure<ZoneDTO>(parameters, spForCreate);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PutZone.
        /// </summary>
        /// <param name="model">The model<see cref="ZoneEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutZone(ZoneEntity model)
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
                {"ZoneId", model.ZoneId },
                {"ZoneName", model.ZoneName },
                {"CityId", model.CityId }
            };

            var result = await business.ExecStoreProcedure<ZoneDTO>(parameters, spForUpdate);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The DeleteZone.
        /// </summary>
        /// <param name="model">The model<see cref="ZoneEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{ZoneId}")]
        public async Task<IActionResult> DeleteZone(Int32? ZoneId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"ZoneId", ZoneId }
            };

            var result = await business.ExecStoreProcedure<ZoneDTO>(parameters, spForDelete);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

    }
}

