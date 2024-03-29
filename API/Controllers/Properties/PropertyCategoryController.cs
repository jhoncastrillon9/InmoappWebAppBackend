namespace API.Controllers
{
    using Business.Properties;
    using Commons.DTOs.Properties;
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
    /// Defines the <see cref="PropertyCategoryController" />.
    /// </summary>    
    [Route("Properties/[controller]")]
    [ApiController]
    public class PropertyCategoryController : BaseController
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly PropertyCategoryService _PropertyCategoryService;
        private readonly string spForRead = "Properties.PropertyCategory_READ";
        private readonly string spForList = "Properties.PropertyCategory_LIST";
        private readonly string spForCreate = "Properties.PropertyCategory_CREATE";
        private readonly string spForUpdate = "Properties.PropertyCategory_UPDATE";
        private readonly string spForDelete = "Properties.PropertyCategory_DELETE";

        /// <summary>
        /// Initializes a new instance of the <see cref="PropertyCategoryController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public PropertyCategoryController(PropertyCategoryService propertyCategoryService, ILogger<PropertyCategoryController> logger, IHttpContextAccessor httpContext) : base(httpContext, logger)
        {
            _PropertyCategoryService = propertyCategoryService;
        }

        /// <summary>
        /// The GetPropertyCategory.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [Authorize(Roles = "SuperAdmin")]
        [HttpGet]
        public async Task<IActionResult> GetPropertyCategory(Int32? PropertyCategoryId, String CategoryName)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"PropertyCategoryId", PropertyCategoryId },
                    {"CategoryName", CategoryName }
                };

                response = await _PropertyCategoryService.ExecStoreProcedure<PropertyCategoryDTO>(parameters, spForRead);
                
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
                return GenericExceptionHandling(ex);
            }
            
        }

        /// <summary>
        /// The GetPropertyCategory.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [Authorize(Roles = "SuperAdmin,CompanyAdmin,PropertyUser")]
        [HttpGet("list")]
        public async Task<IActionResult> GetListPropertyCategory(Int32? PropertyCategoryId, String CategoryName)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"PropertyCategoryId", PropertyCategoryId },
                    {"CategoryName", CategoryName }
                };

                response = await _PropertyCategoryService.ExecStoreProcedure<PropertyCategoryDTO>(parameters, spForList);
              
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
                return GenericExceptionHandling(ex);
            }
            
        }

        /// <summary>
        /// The GetPropertyCategory.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [Authorize(Roles = "SuperAdmin")]
        [HttpGet("{PropertyCategoryId}")]
        public async Task<IActionResult> GetPropertyCategory(Int32 PropertyCategoryId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"PropertyCategoryId", PropertyCategoryId },
                    {"CategoryName", null }
                };

                response = await _PropertyCategoryService.ExecStoreProcedure<PropertyCategoryDTO>(parameters, spForRead);

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
                return GenericExceptionHandling(ex);
            }
            
        }

        /// <summary>
        /// The PostPropertyCategory.
        /// </summary>
        /// <param name="model">The model<see cref="PropertyCategoryEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [Authorize(Roles = "SuperAdmin")]
        [HttpPost]
        public async Task<IActionResult> PostPropertyCategory(PropertyCategoryDTO model)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"CategoryName", model.CategoryName }
                };

                response = await _PropertyCategoryService.ExecStoreProcedure<PropertyCategoryDTO>(parameters, spForCreate);
                
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
                return GenericExceptionHandling(ex);
            }
        }

        /// <summary>
        /// The PutPropertyCategory.
        /// </summary>
        /// <param name="model">The model<see cref="PropertyCategoryEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [Authorize(Roles = "SuperAdmin")]
        [HttpPut]
        public async Task<IActionResult> PutPropertyCategory(PropertyCategoryDTO model)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"PropertyCategoryId", model.PropertyCategoryId },
                    {"CategoryName", model.CategoryName }
                };

                response = await _PropertyCategoryService.ExecStoreProcedure<PropertyCategoryDTO>(parameters, spForUpdate);
                
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
                return GenericExceptionHandling(ex);
            }
            
        }

        /// <summary>
        /// The DeletePropertyCategory.
        /// </summary>
        /// <param name="model">The model<see cref="PropertyCategoryEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [Authorize(Roles = "SuperAdmin")]
        [HttpDelete("{PropertyCategoryId}")]
        public async Task<IActionResult> DeletePropertyCategory(Int32? PropertyCategoryId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"PropertyCategoryId", PropertyCategoryId }
                };

                response = await _PropertyCategoryService.ExecStoreProcedure<PropertyCategoryDTO>(parameters, spForDelete);
                
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
                return GenericExceptionHandling(ex);
            }
           
        }

    }
}

