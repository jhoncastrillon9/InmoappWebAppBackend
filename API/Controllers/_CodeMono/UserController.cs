namespace API.Controllers
{
    using CodeMono.Business;
    using Commons.DTOs.Users;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Extensions.Configuration;
    using System;
    using System.Collections.Generic;
    using System.Threading.Tasks;


    /// <summary>
    /// Defines the <see cref="UserController" />.
    /// </summary>
    //[Authorize]
    [Route("[controller]")]
    [ApiController]
    public class UserController
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly UserService business;

        /// <summary>
        /// Initializes a new instance of the <see cref="UserController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public UserController(IConfiguration config)
        {
            business = new UserService(config);
        }

        /// <summary>
        /// The GetUser.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet]
        public async Task<IActionResult> GetUser(Int32? UserId, String FirstName, String LastName, Int16? UserTypeId, String Username, Byte? Active)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"UserId", UserId },
                {"FirstName", FirstName },
                {"LastName", LastName },
                {"UserTypeId", UserTypeId },
                {"Username", Username },
                {"Active", Active }
            };

            var result = await business.GetUser(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetUser.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListUser(Int32? UserId, String FirstName, String LastName, Int16? UserTypeId, String Username, Byte? Active)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"UserId", UserId },
                {"FirstName", FirstName },
                {"LastName", LastName },
                {"UserTypeId", UserTypeId },
                {"Username", Username },
                {"Active", Active }
            };

            var result = await business.GetListUser(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetUser.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{UserId}")]
        public async Task<IActionResult> GetUser(Int32 UserId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"UserId", UserId },
                {"FirstName", null },
                {"LastName", null },
                {"UserTypeId", null },
                {"Username", null },
                {"Active", null }
            };

            var result = await business.GetUser(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PostUser.
        /// </summary>
        /// <param name="model">The model<see cref="UserModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostUser(UserDTO model)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"FirstName", model.FirstName },
                {"LastName", model.LastName },
                {"UserTypeId", model.UserTypeId },
                {"Username", model.Username },
                {"Password", model.Password },
                {"Avatar", model.Avatar },
                {"CreatedBy", model.CreatedBy }
            };

            var result = await business.PostUser(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PutUser.
        /// </summary>
        /// <param name="model">The model<see cref="UserModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutUser(UserDTO model)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"UserId", model.UserId },
                {"FirstName", model.FirstName },
                {"LastName", model.LastName },
                {"UserTypeId", model.UserTypeId },
                {"Username", model.Username },
                {"Password", model.Password },
                {"Avatar", model.Avatar },
                {"UpdatedBy", model.UpdatedBy }
            };

            var result = await business.PutUser(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The EnableUser.
        /// </summary>
        /// <param name="model">The model<see cref="UserModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut("enable")]
        public async Task<IActionResult> EnableUser(UserDTO model)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"UserId", model.UserId },
                {"UpdatedBy", model.UpdatedBy }
            };

            var result = await business.EnableUser(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The DisableUser.
        /// </summary>
        /// <param name="model">The model<see cref="UserModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut("disable")]
        public async Task<IActionResult> DisableUser(UserDTO model)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"UserId", model.UserId },
                {"DisabledBy", model.DisabledBy }
            };

            var result = await business.DisableUser(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The DeleteUser.
        /// </summary>
        /// <param name="model">The model<see cref="UserModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{UserId}")]
        public async Task<IActionResult> DeleteUser(Int32? UserId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"UserId", UserId }
            };

            var result = await business.DeleteUser(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

    }
}


