namespace API.Controllers
{
    using Business.Tenants;
    using Commons.DTOs.Tenants;
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Http;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Extensions.Configuration;
    using System;
    using System.Collections.Generic;
    using System.Security.Claims;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="TenantController" />.
    /// </summary>
    [Authorize(Roles = "Superadmin,CompanyAdmin,TennatUser")]
    [Route("Tenants/[controller]")]
    [ApiController]
    public class TenantController : BaseController
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly TenantService _TenantService;
        private readonly string spForRead = "Tenants.Tenant_READ";
        private readonly string spForList = "Tenants.Tenant_LIST";
        private readonly string spForCreate = "Tenants.Tenant_CREATE";
        private readonly string spForUpdate = "Tenants.Tenant_UPDATE";
        private readonly string spForDelete = "Tenants.Tenant_DELETE";

        /// <summary>
        /// Initializes a new instance of the <see cref="TenantController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public TenantController(TenantService tenantService, IHttpContextAccessor httpContext) : base(httpContext)
        {
            _TenantService = tenantService;
        }

        /// <summary>
        /// The GetTenant.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet]
        public async Task<IActionResult> GetTenant(Int32? TenantId, String TenantName, String Document, String Telephone, String Mobile, String Email, String Address, String Observation, Int32? CompayId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"TenantId", TenantId },
                    {"TenantName", TenantName },
                    {"Document", Document },
                    {"Telephone", Telephone },
                    {"Mobile", Mobile },
                    {"Email", Email },
                    {"Address", Address },
                    {"Observation", Observation },
                    {"CompayId", currentCompanyIdUser }
                };

                response = await _TenantService.ExecStoreProcedure<TenantDTO>(parameters, spForRead);

                return new OkObjectResult(response);
            }
            catch (ApplicationException ex)
            {
                base.response.ExecutionError = true;
                base.response.Message = ex.Message;
                return new BadRequestObjectResult(base.response);
            }
            catch (Exception ex)
            {
                base.response.ExecutionError = true;
                return new BadRequestObjectResult(base.response);
            }
          
        }

        /// <summary>
        /// The GetTenant.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListTenant(Int32? TenantId, String TenantName, String Document, String Telephone, String Mobile, String Email, String Address, String Observation, Int32? CompayId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"TenantId", TenantId },
                    {"TenantName", TenantName },
                    {"Document", Document },
                    {"Telephone", Telephone },
                    {"Mobile", Mobile },
                    {"Email", Email },
                    {"Address", Address },
                    {"Observation", Observation },
                    {"CompayId", currentCompanyIdUser }
                };

                response = await _TenantService.ExecStoreProcedure<TenantDTO>(parameters, spForList);

                return new OkObjectResult(response);
            }
            catch (ApplicationException ex)
            {
                base.response.ExecutionError = true;
                base.response.Message = ex.Message;
                return new BadRequestObjectResult(base.response);
            }
            catch (Exception ex)
            {
                base.response.ExecutionError = true;
                return new BadRequestObjectResult(base.response);
            }
           
        }

        /// <summary>
        /// The GetTenant.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{TenantId}")]
        public async Task<IActionResult> GetTenant(Int32 TenantId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"TenantId", TenantId },
                    {"TenantName", null },
                    {"Document", null },
                    {"Telephone", null },
                    {"Mobile", null },
                    {"Email", null },
                    {"Address", null },
                    {"Observation", null },
                    {"CompayId", currentCompanyIdUser }
                };

                response = await _TenantService.ExecStoreProcedure<TenantDTO>(parameters, spForRead);

                return new OkObjectResult(response);
            }
            catch (ApplicationException ex)
            {
                base.response.ExecutionError = true;
                base.response.Message = ex.Message;
                return new BadRequestObjectResult(base.response);
            }
            catch (Exception ex)
            {
                base.response.ExecutionError = true;
                return new BadRequestObjectResult(base.response);
            }
          
        }

        /// <summary>
        /// The PostTenant.
        /// </summary>
        /// <param name="model">The model<see cref="TenantEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostTenant(TenantDTO model)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"TenantName", model.TenantName },
                    {"Document", model.Document },
                    {"Telephone", model.Telephone },
                    {"Mobile", model.Mobile },
                    {"Email", model.Email },
                    {"Address", model.Address },
                    {"Observation", model.Observation },
                    {"CompayId", currentCompanyIdUser }
                };

                response = await _TenantService.ExecStoreProcedure<TenantDTO>(parameters, spForCreate);

                return new OkObjectResult(response);

            }
            catch (ApplicationException ex)
            {
                base.response.ExecutionError = true;
                base.response.Message = ex.Message;
                return new BadRequestObjectResult(base.response);
            }
            catch (Exception ex)
            {
                base.response.ExecutionError = true;
                return new BadRequestObjectResult(base.response);
            }           
        }

        /// <summary>
        /// The PutTenant.
        /// </summary>
        /// <param name="model">The model<see cref="TenantEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutTenant(TenantDTO model)
        {
            try
            {
                
                _TenantService.ValidateCompany(_TenantService.FindById(model.TenantId).CompayId);
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"TenantId", model.TenantId },
                    {"TenantName", model.TenantName },
                    {"Document", model.Document },
                    {"Telephone", model.Telephone },
                    {"Mobile", model.Mobile },
                    {"Email", model.Email },
                    {"Address", model.Address },
                    {"Observation", model.Observation },
                    {"CompayId", currentCompanyIdUser }
                };

                response = await _TenantService.ExecStoreProcedure<TenantDTO>(parameters, spForUpdate);

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
                response.ExecutionError = true;
                return new BadRequestObjectResult(response);
            }            
        }


        /// <summary>
        /// The DeleteTenant.
        /// </summary>
        /// <param name="model">The model<see cref="TenantEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{TenantId}")]
        public async Task<IActionResult> DeleteTenant(Int32? TenantId)
        {
            try
            {

                _TenantService.ValidateCompany(_TenantService.FindById(TenantId).CompayId);
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"TenantId", TenantId }
                };

                response = await _TenantService.ExecStoreProcedure<TenantDTO>(parameters, spForDelete);
                
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
                response.ExecutionError = true;
                return new BadRequestObjectResult(response);
            }
           
        }

    }
}

