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
    /// Defines the <see cref="StateController" />.
    /// </summary>
    [Authorize]
    [Route("Commons/[controller]")]
    [ApiController]
    public class StateController : ControllerBase
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly StateService business;
        private string spForRead = "Commons.State_READ";
        private string spForList = "Commons.State_LIST";
        private string spForCreate = "Commons.State_CREATE";
        private string spForUpdate = "Commons.State_UPDATE";
        private string spForDelete = "Commons.State_DELETE";

        /// <summary>
        /// Initializes a new instance of the <see cref="StateController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public StateController(StateService stateService)
        {
            business = stateService;
        }

        /// <summary>
        /// The GetState.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet]
        public async Task<IActionResult> GetState(Int32? StateId, String StateName)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"StateId", StateId },
                {"StateName", StateName }
            };

            var result = await business.ExecStoreProcedure<StateDTO>(parameters, spForRead);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetState.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListState(Int32? StateId, String StateName)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"StateId", StateId },
                {"StateName", StateName }
            };

            var result = await business.ExecStoreProcedure<StateDTO>(parameters, spForList);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetState.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{StateId}")]
        public async Task<IActionResult> GetState(Int32 StateId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"StateId", StateId },
                {"StateName", null }
            };

            var result = await business.ExecStoreProcedure<StateDTO>(parameters, spForRead);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PostState.
        /// </summary>
        /// <param name="model">The model<see cref="StateEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostState(StateEntity model)
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
                {"StateName", model.StateName }
            };

            var result = await business.ExecStoreProcedure<StateDTO>(parameters, spForCreate);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PutState.
        /// </summary>
        /// <param name="model">The model<see cref="StateEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutState(StateEntity model)
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
                {"StateId", model.StateId },
                {"StateName", model.StateName }
            };

            var result = await business.ExecStoreProcedure<StateDTO>(parameters, spForUpdate);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }


        /// <summary>
        /// The DeleteState.
        /// </summary>
        /// <param name="model">The model<see cref="StateEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{StateId}")]
        public async Task<IActionResult> DeleteState(Int32? StateId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"StateId", StateId }
            };

            var result = await business.ExecStoreProcedure<StateDTO>(parameters, spForDelete);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

    }
}

