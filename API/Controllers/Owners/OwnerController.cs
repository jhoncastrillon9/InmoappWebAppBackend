namespace API.Controllers
{
    using Business.Owners;
    using Commons.DTOs.Owners;
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Http;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Extensions.Configuration;
    using System;
    using System.Collections.Generic;
    using System.Security.Claims;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="OwnerController" />.
    /// </summary>
    [Authorize(Roles = "SuperAdmin,CompanyAdmin,OwnerUser")]
    [Route("Owners/[controller]")]
    [ApiController]
    public class OwnerController : BaseController
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly OwnerService _OwnerService;
        private readonly string spForRead = "Owners.Owner_READ";
        private readonly string spForList = "Owners.Owner_LIST";
        private readonly string spForCreate = "Owners.Owner_CREATE";
        private readonly string spForUpdate = "Owners.Owner_UPDATE";
        private readonly string spForDelete = "Owners.Owner_DELETE";

        /// <summary>
        /// Initializes a new instance of the <see cref="OwnerController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public OwnerController(OwnerService ownerService, IHttpContextAccessor httpContext) : base(httpContext)
        {
            _OwnerService = ownerService;
        }

        /// <summary>
        /// The GetOwner.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet]
        public async Task<IActionResult> GetOwner(Int32? OwnerId, String OwnerName, String Document, String Telephone, String Mobile, String Email, String Address, String Observation, Int32? CompayId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"OwnerId", OwnerId },
                    {"OwnerName", OwnerName },
                    {"Document", Document },
                    {"Telephone", Telephone },
                    {"Mobile", Mobile },
                    {"Email", Email },
                    {"Address", Address },
                    {"Observation", Observation },
                    {"CompayId", currentCompanyIdUser }
                };

                var responde = await _OwnerService.ExecStoreProcedure<OwnerDTO>(parameters, spForRead);

                return new OkObjectResult(responde);

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
        /// The GetOwner.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListOwner(Int32? OwnerId, String OwnerName, String Document, String Telephone, String Mobile, String Email, String Address, String Observation, Int32? CompayId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"OwnerId", OwnerId },
                    {"OwnerName", OwnerName },
                    {"Document", Document },
                    {"Telephone", Telephone },
                    {"Mobile", Mobile },
                    {"Email", Email },
                    {"Address", Address },
                    {"Observation", Observation },
                    {"CompayId", currentCompanyIdUser }
                };

                response = await _OwnerService.ExecStoreProcedure<OwnerDTO>(parameters, spForList);

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
        /// The GetOwner.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{OwnerId}")]
        public async Task<IActionResult> GetOwner(Int32 OwnerId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"OwnerId", OwnerId },
                {"OwnerName", null },
                {"Document", null },
                {"Telephone", null },
                {"Mobile", null },
                {"Email", null },
                {"Address", null },
                {"Observation", null },
                {"CompayId", currentCompanyIdUser }
            };

                response = await _OwnerService.ExecStoreProcedure<OwnerDTO>(parameters, spForRead);

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
        /// The PostOwner.
        /// </summary>
        /// <param name="model">The model<see cref="OwnerEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostOwner(OwnerDTO model)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"OwnerName", model.OwnerName },
                    {"Document", model.Document },
                    {"Telephone", model.Telephone },
                    {"Mobile", model.Mobile },
                    {"Email", model.Email },
                    {"Address", model.Address },
                    {"Observation", model.Observation },
                    {"CompayId", currentCompanyIdUser }
                };

                 response = await _OwnerService.ExecStoreProcedure<OwnerDTO>(parameters, spForCreate);

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
        /// The PutOwner.
        /// </summary>
        /// <param name="model">The model<see cref="OwnerEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutOwner(OwnerDTO model)
        {
            try
            {
                
                _OwnerService.ValidateCompany(_OwnerService.FindById(model.OwnerId).CompayId);
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"OwnerId", model.OwnerId },
                    {"OwnerName", model.OwnerName },
                    {"Document", model.Document },
                    {"Telephone", model.Telephone },
                    {"Mobile", model.Mobile },
                    {"Email", model.Email },
                    {"Address", model.Address },
                    {"Observation", model.Observation },
                    {"CompayId", currentCompanyIdUser}
                };

                response = await _OwnerService.ExecStoreProcedure<OwnerDTO>(parameters, spForUpdate);
              
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
        /// The DeleteOwner.
        /// </summary>
        /// <param name="model">The model<see cref="OwnerEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{OwnerId}")]
        public async Task<IActionResult> DeleteOwner(Int32? OwnerId)
        {
            try
            {

                _OwnerService.ValidateCompany(_OwnerService.FindById(OwnerId).CompayId);
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"OwnerId", OwnerId }
                };

                response = await _OwnerService.ExecStoreProcedure<OwnerDTO>(parameters, spForDelete);
              
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

    }
}

