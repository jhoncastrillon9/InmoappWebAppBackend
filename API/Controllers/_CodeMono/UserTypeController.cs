namespace API.Controllers
{
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Extensions.Configuration;
    using System;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    using CodeMono.Business;
    using CodeMono.Entities;


    /// <summary>
    /// Defines the <see cref="UserTypeController" />.
    /// </summary>
    //[Authorize]
    [Route("[controller]")]
    [ApiController]
    public class UserTypeController
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly UserTypeService business;

        /// <summary>
        /// Initializes a new instance of the <see cref="UserTypeController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public UserTypeController(IConfiguration config)
        {
            business = new UserTypeService(config);
        }

        /// <summary>
        /// The GetUserType.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet]
        public async Task<IActionResult> GetUserType(Int16? UserTypeId, String UserTypeName, Byte? Active)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"UserTypeId", UserTypeId },
                {"UserTypeName", UserTypeName },
                {"Active", Active }
            };

            var result = await business.GetUserType(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetUserType.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListUserType(Int16? UserTypeId, String UserTypeName, Byte? Active)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"UserTypeId", UserTypeId },
                {"UserTypeName", UserTypeName },
                {"Active", Active }
            };

            var result = await business.GetListUserType(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetUserType.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{UserTypeId}")]
        public async Task<IActionResult> GetUserType(Int16 UserTypeId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"UserTypeId", UserTypeId }
            };

            var result = await business.GetUserType(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PostUserType.
        /// </summary>
        /// <param name="model">The model<see cref="UserTypeModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostUserType(UserTypeModel model)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"UserTypeName", model.UserTypeName },
                {"CreatedBy", model.CreatedBy }
            };

            var result = await business.PostUserType(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PutUserType.
        /// </summary>
        /// <param name="model">The model<see cref="UserTypeModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutUserType(UserTypeModel model)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"UserTypeId", model.UserTypeId },
                {"UserTypeName", model.UserTypeName },
                {"UpdatedBy", model.UpdatedBy }
            };

            var result = await business.PutUserType(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The EnableUserType.
        /// </summary>
        /// <param name="model">The model<see cref="UserTypeModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut("enable")]
        public async Task<IActionResult> EnableUserType(UserTypeModel model)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"UserTypeId", model.UserTypeId },
                {"UpdatedBy", model.UpdatedBy }
            };

            var result = await business.EnableUserType(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The DisableUserType.
        /// </summary>
        /// <param name="model">The model<see cref="UserTypeModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut("disable")]
        public async Task<IActionResult> DisableUserType(UserTypeModel model)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"UserTypeId", model.UserTypeId },
                {"DisabledBy", model.DisabledBy }
            };

            var result = await business.DisableUserType(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The DeleteUserType.
        /// </summary>
        /// <param name="model">The model<see cref="UserTypeModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{UserTypeId}")]
        public async Task<IActionResult> DeleteUserType(Int16? UserTypeId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"UserTypeId", UserTypeId }
            };

            var result = await business.DeleteUserType(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

    }
}


