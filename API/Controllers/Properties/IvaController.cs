namespace API.Controllers
{
    using Business.Properties;
    using Commons.DTOs.Properties;
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Extensions.Configuration;
    using System;
    using System.Collections.Generic;
    using System.Security.Claims;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="IvaController" />.
    /// </summary>
    [Authorize(Roles = "SuperAdmin")]
    [Route("Properties/[controller]")]
    [ApiController]
    public class IvaController : BaseController
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly IvaService _IvaService;
        private readonly string spForRead = "Properties.Iva_READ";
        private readonly string spForList = "Properties.Iva_LIST";
        private readonly string spForCreate = "Properties.Iva_CREATE";
        private readonly string spForUpdate = "Properties.Iva_UPDATE";
        private readonly string spForDelete = "Properties.Iva_DELETE";

        /// <summary>
        /// Initializes a new instance of the <see cref="IvaController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public IvaController(IvaService ivaService)
        {
            _IvaService = ivaService;
        }

        /// <summary>
        /// The GetIva.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet]
        public async Task<IActionResult> GetIva(Int32? IvaId)
        {
            try
            {
                LoadUserSession();
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"IvaId", IvaId }
                };

                response = await _IvaService.ExecStoreProcedure<IvaDTO>(parameters, spForRead);
                
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
        /// The GetIva.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListIva(Int32? IvaId)
        {
            try
            {
                LoadUserSession();
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"IvaId", IvaId }
                };

                response = await _IvaService.ExecStoreProcedure<IvaDTO>(parameters, spForList);
                
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
        /// The GetIva.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{IvaId}")]
        public async Task<IActionResult> GetIva(Int32 IvaId)
        {
            try
            {
                LoadUserSession();
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"IvaId", IvaId }
                };

                response = await _IvaService.ExecStoreProcedure<IvaDTO>(parameters, spForRead);

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
        /// The PostIva.
        /// </summary>
        /// <param name="model">The model<see cref="IvaEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostIva(IvaDTO model)
        {
            try
            {
                LoadUserSession();
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"Valor", model.Valor }
                };

                response = await _IvaService.ExecStoreProcedure<IvaDTO>(parameters, spForCreate);
               
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
        /// The PutIva.
        /// </summary>
        /// <param name="model">The model<see cref="IvaEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutIva(IvaDTO model)
        {
            try
            {
                LoadUserSession();
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"IvaId", model.IvaId },
                    {"Valor", model.Valor }
                };

                var response = await _IvaService.ExecStoreProcedure<IvaDTO>(parameters, spForUpdate);
               
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
        /// The DeleteIva.
        /// </summary>
        /// <param name="model">The model<see cref="IvaEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{IvaId}")]
        public async Task<IActionResult> DeleteIva(Int32? IvaId)
        {
            try
            {
                LoadUserSession();
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"IvaId", IvaId }
                };

                response = await _IvaService.ExecStoreProcedure<IvaDTO>(parameters, spForDelete);
              
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

