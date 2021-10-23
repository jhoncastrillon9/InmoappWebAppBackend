using Business.Properties;
using Commons.DTOs.Properties;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API.Controllers
{
    /// <summary>
    /// Defines the <see cref="PropertyController" />.
    /// </summary>
    [Authorize(Roles = "SuperAdmin,CompanyAdmin,PropertyUser")]
    [Route("Properties/[controller]")]
    [ApiController]
    public class PropertyController : BaseController
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly PropertyService _PropertyService;
        private readonly string spForRead = "Properties.Property_READ";
        private readonly string spForList = "Properties.Property_LIST";
        private readonly string spForCreate = "Properties.Property_CREATE";
        private readonly string spForUpdate = "Properties.Property_UPDATE";
        private readonly string spForDelete = "Properties.Property_DELETE";

        /// <summary>
        /// Initializes a new instance of the <see cref="PropertyController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public PropertyController(PropertyService propertyService, ILogger<PropertyController> logger, IHttpContextAccessor httpContext) : base(httpContext, logger)
        {
            _PropertyService = propertyService;
        }

        /// <summary>
        /// The GetProperty.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet]
        public async Task<IActionResult> GetProperty(Int32? PropertyId, Int32? IdIva, String Code, String Title, String Description, String Address, Boolean? Reception, Boolean? Pool, String Observation, Int32? PropertyStatusId, Int32? CityId, Int32? ZoneId, Int32? OwnerId, Int32? PropertyCategoryId, Int32? TypeOfferId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = GenerateDictionary(PropertyId, IdIva, Code, Title, Description, Address, Reception, Pool, Observation, PropertyStatusId, CityId, ZoneId, OwnerId, PropertyCategoryId, TypeOfferId);
                response = await _PropertyService.ExecStoreProcedure<PropertyDTO>(parameters, spForRead);
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
        /// The GetProperty.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListProperty(Int32? PropertyId, Int32? IdIva, String Code, String Title, String Description, String Address, Boolean? Reception, Boolean? Pool, String Observation, Int32? PropertyStatusId, Int32? CityId, Int32? ZoneId, Int32? OwnerId, Int32? PropertyCategoryId, Int32? TypeOfferId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = GenerateDictionary(PropertyId, IdIva, Code, Title, Description, Address, Reception, Pool, Observation, PropertyStatusId, CityId, ZoneId, OwnerId, PropertyCategoryId, TypeOfferId);
                response = await _PropertyService.ExecStoreProcedure<PropertyDTO>(parameters, spForList);
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
        /// The GetProperty.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{PropertyId}")]
        public async Task<IActionResult> GetProperty(Int32 PropertyId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"PropertyId", PropertyId },
                    {"IdIva", null },
                    {"Code", null },
                    {"Title", null },
                    {"Description", null },
                    {"Address", null },
                    {"Reception", null },
                    {"Pool", null },
                    {"Observation", null },
                    {"PropertyStatusId", null },
                    {"CityId", null },
                    {"ZoneId", null },
                    {"OwnerId", null },
                    {"PropertyCategoryId", null },
                    {"TypeOfferId", null },
                    {"CompayId", currentCompanyIdUser }
                };

                response = await _PropertyService.ExecStoreProcedure<PropertyDTO>(parameters, spForRead);

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
        /// The PostProperty.
        /// </summary>
        /// <param name="model">The model<see cref="PropertyEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostProperty(PropertyDTO model)
        {
            try
            {               

                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"IdIva", model.IdIva },
                    {"Code", model.Code },
                    {"Title", model.Title },
                    {"Description", model.Description },
                    {"Address", model.Address },
                    {"PriceOwner", model.PriceOwner },
                    {"Percentage", model.Percentage },
                    {"FeeCompany", model.FeeCompany },
                    {"RecruitmentDate", model.RecruitmentDate },
                    {"FinalPrice", model.FinalPrice },
                    {"Rooms", model.Rooms },
                    {"Toilets", model.Toilets },
                    {"Reception", model.Reception },
                    {"Pool", model.Pool },
                    {"Area", model.Area },
                    {"Observation", model.Observation },
                    {"PropertyStatusId", model.PropertyStatusId },
                    {"CityId", model.CityId },
                    {"ZoneId", model.ZoneId },
                    {"OwnerId", model.OwnerId },
                    {"PropertyCategoryId", model.PropertyCategoryId },
                    {"TypeOfferId", model.TypeOfferId },
                    {"CompayId", currentCompanyIdUser }
                };

                response = await _PropertyService.ExecStoreProcedure<PropertyDTO>(parameters, spForCreate);

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
        /// The PutProperty.
        /// </summary>
        /// <param name="model">The model<see cref="PropertyEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutProperty(PropertyDTO model)
        {

            try
            {
                _PropertyService.ValidateCompany(_PropertyService.FindById(model.PropertyId).CompayId);

                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"PropertyId", model.PropertyId },
                    {"IdIva", model.IdIva },
                    {"Code", model.Code },
                    {"Title", model.Title },
                    {"Description", model.Description },
                    {"Address", model.Address },
                    {"PriceOwner", model.PriceOwner },
                    {"Percentage", model.Percentage },
                    {"FeeCompany", model.FeeCompany },
                    {"RecruitmentDate", model.RecruitmentDate },
                    {"FinalPrice", model.FinalPrice },
                    {"Rooms", model.Rooms },
                    {"Toilets", model.Toilets },
                    {"Reception", model.Reception },
                    {"Pool", model.Pool },
                    {"Area", model.Area },
                    {"Observation", model.Observation },
                    {"PropertyStatusId", model.PropertyStatusId },
                    {"CityId", model.CityId },
                    {"ZoneId", model.ZoneId },
                    {"OwnerId", model.OwnerId },
                    {"PropertyCategoryId", model.PropertyCategoryId },
                    {"TypeOfferId", model.TypeOfferId },
                    {"CompayId", currentCompanyIdUser }
                };

                response = await _PropertyService.ExecStoreProcedure<PropertyDTO>(parameters, spForUpdate);
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
        /// The DeleteProperty.
        /// </summary>
        /// <param name="model">The model<see cref="PropertyEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{PropertyId}")]
        public async Task<IActionResult> DeleteProperty(Int32? PropertyId)
        {
            try
            {
                _PropertyService.ValidateCompany(_PropertyService.FindById(PropertyId).CompayId);
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"PropertyId", PropertyId }
                };

                response = await _PropertyService.ExecStoreProcedure<PropertyDTO>(parameters, spForDelete);              
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
        /// crear diccionario
        /// </summary>
        /// <returns></returns>
        private Dictionary<string, dynamic> GenerateDictionary(int? PropertyId, int? IdIva, string Code, string Title, string Description, string Address, bool? Reception, bool? Pool, string Observation, int? PropertyStatusId, int? CityId, int? ZoneId, int? OwnerId, int? PropertyCategoryId, int? TypeOfferId)
        {
            return new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"PropertyId", PropertyId },
                {"IdIva", IdIva },
                {"Code", Code },
                {"Title", Title },
                {"Description", Description },
                {"Address", Address },
                {"Reception", Reception },
                {"Pool", Pool },
                {"Observation", Observation },
                {"PropertyStatusId", PropertyStatusId },
                {"CityId", CityId },
                {"ZoneId", ZoneId },
                {"OwnerId", OwnerId },
                {"PropertyCategoryId", PropertyCategoryId },
                {"TypeOfferId", TypeOfferId },
                {"CompayId", currentCompanyIdUser }
            };
        }

    }
}

