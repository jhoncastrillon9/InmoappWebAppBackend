using Business.Users;
using Commons.DTOs.Users;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API.Controllers
{

    /// <summary>
    /// Defines the <see cref="UserController" />.
    /// </summary>
    [Authorize]
    [Route("[controller]")]
    [ApiController]
    public class UserController : BaseController
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly UserService _UserServices;
        private string spForRead = "CodeMono.User_READ";
        private string spForList = "CodeMono.User_LIST";
        private string spForCreate = "CodeMono.User_CREATE";
        private string spForUpdate = "CodeMono.User_UPDATE";
        private string spForDelete = "CodeMono.User_DELETE";
        private string spForEnable = "CodeMono.User_ENABLE";
        private string spForDisable = "CodeMono.User_DISABLE";

        /// <summary>
        /// Initializes a new instance of the <see cref="UserController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public UserController(UserService userService)
        {
            _UserServices = userService;
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
            try
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

                var result = await _UserServices.ExecStoreProcedure<UserDTO>(parameters, spForRead);
                return new OkObjectResult(result);
            }
            catch (ApplicationException ex)
            {
                response.message = ex.Message;
                return new BadRequestObjectResult(response);
            }
            catch (Exception ex)
            {
                return new BadRequestObjectResult(response);
            }
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
            try
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

                var result = await _UserServices.ExecStoreProcedure<UserDTO>(parameters, spForList);
                return new OkObjectResult(result);
            }
            catch (ApplicationException ex)
            {
                response.message = ex.Message;
                return new BadRequestObjectResult(response);
            }
            catch (Exception ex)
            {
                return new BadRequestObjectResult(response);
            }
        }

        /// <summary>
        /// The GetUser.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{UserId}")]
        public async Task<IActionResult> GetUser(Int32 UserId)
        {
            try
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

                var result = await _UserServices.ExecStoreProcedure<UserDTO>(parameters, spForRead);

                return new OkObjectResult(result);
            }
            catch (ApplicationException ex)
            {
                response.message = ex.Message;
                return new BadRequestObjectResult(response);
            }
            catch (Exception ex)
            {
                return new BadRequestObjectResult(response);
            }         
        }

        /// <summary>
        /// The PostUser.
        /// </summary>
        /// <param name="model">The model<see cref="UserModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostUser(UserDTO model)
        {
            try
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

                var result = await _UserServices.ExecStoreProcedure<UserDTO>(parameters, spForCreate);

                return new OkObjectResult(result);
            }
            catch (ApplicationException ex)
            {
                response.message = ex.Message;
                return new BadRequestObjectResult(response);
            }
            catch (Exception ex)
            {
                return new BadRequestObjectResult(response);
            }
        }

        /// <summary>
        /// The PutUser.
        /// </summary>
        /// <param name="model">The model<see cref="UserModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutUser(UserDTO model)
        {
            try
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

                var result = await _UserServices.ExecStoreProcedure<UserDTO>(parameters, spForUpdate);

                return new OkObjectResult(result);
            }
            catch (ApplicationException ex)
            {
                response.message = ex.Message;
                return new BadRequestObjectResult(response);
            }
            catch (Exception ex)
            {
                return new BadRequestObjectResult(response);
            }
        }

        /// <summary>
        /// The EnableUser.
        /// </summary>
        /// <param name="model">The model<see cref="UserModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut("enable")]
        public async Task<IActionResult> EnableUser(UserDTO model)
        {
            try
            {
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"UserId", model.UserId },
                    {"UpdatedBy", model.UpdatedBy }
                };

                var result = await _UserServices.ExecStoreProcedure<UserDTO>(parameters, spForEnable);
                return new OkObjectResult(result);
            }
            catch (ApplicationException ex)
            {
                response.message = ex.Message;
                return new BadRequestObjectResult(response);
            }
            catch (Exception ex)
            {
                return new BadRequestObjectResult(response);
            }
        }

        /// <summary>
        /// The DisableUser.
        /// </summary>
        /// <param name="model">The model<see cref="UserModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut("disable")]
        public async Task<IActionResult> DisableUser(UserDTO model)
        {
            try
            {

                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"UserId", model.UserId },
                    {"DisabledBy", model.DisabledBy }
                };

                var result = await _UserServices.ExecStoreProcedure<UserDTO>(parameters, spForDisable);
                return new OkObjectResult(result);
            }
            catch (ApplicationException ex)
            {
                response.message = ex.Message;
                return new BadRequestObjectResult(response);
            }
            catch (Exception ex)
            {
                return new BadRequestObjectResult(response);
            }
        }

        /// <summary>
        /// The DeleteUser.
        /// </summary>
        /// <param name="model">The model<see cref="UserModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{UserId}")]
        public async Task<IActionResult> DeleteUser(Int32? UserId)
        {
            try
            {
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"UserId", UserId }
                };

                var result = await _UserServices.ExecStoreProcedure<UserDTO>(parameters, spForDelete);
                return new OkObjectResult(result);
            }
            catch (ApplicationException ex)
            {
                response.message = ex.Message;
                return new BadRequestObjectResult(response);
            }
            catch (Exception ex)
            {
                return new BadRequestObjectResult(response);
            }
        }
    }
}


