using Business.Users;
using Commons.DTOs.Users;
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
    /// Defines the <see cref="UserTypeController" />.
    /// </summary>
    [Authorize(Roles ="SuperAdmin")]
    [Route("[controller]")]
    [ApiController]
    public class UserTypeController : BaseController
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly UserTypeService _UserTypeService;
        private readonly string spForRead = "CodeMono.UserType_READ";
        private readonly string spForList = "CodeMono.UserType_LIST";
        private readonly string spForCreate = "CodeMono.UserType_CREATE";
        private readonly string spForUpdate = "CodeMono.UserType_UPDATE";
        private readonly string spForDelete = "CodeMono.UserType_DELETE";
        private readonly string spForEnable = "CodeMono.UserType_ENABLE";
        private readonly string spForDisable = "CodeMono.UserType_DISABLE";

        /// <summary>
        /// Initializes a new instance of the <see cref="UserTypeController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public UserTypeController(UserTypeService userTypeService, IHttpContextAccessor httpContext) : base(httpContext)
        {
            _UserTypeService = userTypeService;
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
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"UserTypeId", UserTypeId },
                    {"UserTypeName", UserTypeName },
                    {"Active", Active }
                };

                 response = await _UserTypeService.ExecStoreProcedure<UserTypeDTO>(parameters, spForRead);

                return new OkObjectResult(response);
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
        /// The GetUserType.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListUserType(Int16? UserTypeId, String UserTypeName, Byte? Active)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"UserTypeId", UserTypeId },
                    {"UserTypeName", UserTypeName },
                    {"Active", Active }
                };

                response = await _UserTypeService.ExecStoreProcedure<UserTypeDTO>(parameters, spForList);
                return new OkObjectResult(response);
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
        /// The GetUserType.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{UserTypeId}")]
        public async Task<IActionResult> GetUserType(Int16 UserTypeId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"UserTypeId", UserTypeId }
                };

                response = await _UserTypeService.ExecStoreProcedure<UserTypeDTO>(parameters, spForRead);
             
                return new OkObjectResult(response);
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
        /// The PostUserType.
        /// </summary>
        /// <param name="model">The model<see cref="UserTypeModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostUserType(UserDTO model)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"UserTypeName", model.UserTypeName },
                    {"CreatedBy", model.CreatedBy }
                };

                response = await _UserTypeService.ExecStoreProcedure<UserTypeDTO>(parameters, spForCreate);
                return new OkObjectResult(response);
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
           ;
        }

        /// <summary>
        /// The PutUserType.
        /// </summary>
        /// <param name="model">The model<see cref="UserTypeModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutUserType(UserTypeDTO model)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"UserTypeId", model.UserTypeId },
                    {"UserTypeName", model.UserTypeName },
                    {"UpdatedBy", model.UpdatedBy }
                };

                response = await _UserTypeService.ExecStoreProcedure<UserTypeDTO>(parameters, spForUpdate);
                return new OkObjectResult(response);
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
        /// The EnableUserType.
        /// </summary>
        /// <param name="model">The model<see cref="UserTypeModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut("enable")]
        public async Task<IActionResult> EnableUserType(UserTypeDTO model)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"UserTypeId", model.UserTypeId },
                    {"UpdatedBy", model.UpdatedBy }
                };

                response = await _UserTypeService.ExecStoreProcedure<UserTypeDTO>(parameters, spForEnable);
                return new OkObjectResult(response);
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
        /// The DisableUserType.
        /// </summary>
        /// <param name="model">The model<see cref="UserTypeModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut("disable")]
        public async Task<IActionResult> DisableUserType(UserTypeDTO model)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"UserTypeId", model.UserTypeId },
                    {"DisabledBy", model.DisabledBy }
                };

                response = await _UserTypeService.ExecStoreProcedure<UserTypeDTO>(parameters, spForDisable);

                return new OkObjectResult(response);
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
        /// The DeleteUserType.
        /// </summary>
        /// <param name="model">The model<see cref="UserTypeModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{UserTypeId}")]
        public async Task<IActionResult> DeleteUserType(Int16? UserTypeId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"UserTypeId", UserTypeId }
                };

                response = await _UserTypeService.ExecStoreProcedure<UserTypeDTO>(parameters, spForDelete);
                return new OkObjectResult(response);
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


