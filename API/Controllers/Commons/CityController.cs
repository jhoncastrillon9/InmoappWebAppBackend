namespace API.Controllers
{
    using Business.Commons;
    using Commons.DTOs.Commons;
    using Commons.Enums.Users;
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Extensions.Configuration;
    using System;
    using System.Collections.Generic;
    using System.Security.Claims;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="CityController" />.
    /// </summary>
    [Authorize(Roles = "Admin")]
    // [AuthorizeAttribute(typeof(AuthorizeRoleAttribute), Arguments = new object[] { 10 })]
    [Route("Commons/[controller]")]
    [ApiController]
    public class CityController : ControllerBase
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly CityService business;
        private string spForRead = "Commons.City_READ";
        private string spForList = "Commons.City_LIST";
        private string spForCreate = "Commons.City_CREATE";
        private string spForUpdate = "Commons.City_UPDATE";
        private string spForDelete = "Commons.City_DELETE";

        /// <summary>
        /// Initializes a new instance of the <see cref="CityController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public CityController(CityService cityService)
        {
            business = cityService;
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
            var tt = new List<RoleEmun> { RoleEmun.SuperAdmin };
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"CityId", CityId },
                {"CityName", CityName },
                {"StateId", StateId }
            };

            var result = await business.ExecStoreProcedure<CityDTO>(parameters, spForRead);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
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
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"CityId", CityId },
                {"CityName", CityName },
                {"StateId", StateId }
            };

            var result = await business.ExecStoreProcedure<CityDTO>(parameters, spForList);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetCity.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{CityId}")]
        public async Task<IActionResult> GetCity(Int32 CityId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"CityId", CityId },
                {"CityName", null },
                {"StateId", null }
            };

            var result = await business.ExecStoreProcedure<CityDTO>(parameters, spForRead);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PostCity.
        /// </summary>
        /// <param name="model">The model<see cref="CityEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostCity(CityDTO model)
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
                {"CityName", model.CityName },
                {"StateId", model.StateId }
            };

            var result = await business.ExecStoreProcedure<CityDTO>(parameters, spForCreate);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PutCity.
        /// </summary>
        /// <param name="model">The model<see cref="CityEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutCity(CityDTO model)
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
                {"CityId", model.CityId },
                {"CityName", model.CityName },
                {"StateId", model.StateId }
            };

            var result = await business.ExecStoreProcedure<CityDTO>(parameters, spForUpdate);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }



        /// <summary>
        /// The DeleteCity.
        /// </summary>
        /// <param name="model">The model<see cref="CityEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{CityId}")]
        public async Task<IActionResult> DeleteCity(Int32? CityId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"CityId", CityId }
            };

            var result = await business.ExecStoreProcedure<CityDTO>(parameters, spForDelete);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

    }
}

