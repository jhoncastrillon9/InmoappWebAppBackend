namespace API.Controllers
{
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Extensions.Configuration;
    using System;
    using System.Collections.Generic;
    using System.Security.Claims;
    using System.Threading.Tasks;

    using Business.Properties;
    using Entities.Properties;

    /// <summary>
    /// Defines the <see cref="PropertyController" />.
    /// </summary>
    [Authorize]
    [Route("Properties/[controller]")]
    [ApiController]
    public class PropertyController: ControllerBase
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly PropertyService business;

        /// <summary>
        /// Initializes a new instance of the <see cref="PropertyController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public PropertyController(IConfiguration config)
        {
            business = new PropertyService(config, "Development");
        }

        /// <summary>
        /// The GetProperty.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet]
        public async Task<IActionResult> GetProperty(Int32? PropertyId, Int32? IdIva, String Code, String Title, String Description, String Address, Boolean? Reception, Boolean? Pool, String Observation, Int32? PropertyStatusId, Int32? CityId, Int32? ZoneId, Int32? OwnerId, Int32? PropertyCategoryId, Int32? TypeOfferId, Int32? CompayId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
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
				{"CompayId", CompayId }
            };

            var result = await business.GetProperty(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetProperty.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListProperty(Int32? PropertyId, Int32? IdIva, String Code, String Title, String Description, String Address, Boolean? Reception, Boolean? Pool, String Observation, Int32? PropertyStatusId, Int32? CityId, Int32? ZoneId, Int32? OwnerId, Int32? PropertyCategoryId, Int32? TypeOfferId, Int32? CompayId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
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
				{"CompayId", CompayId }
            };

            var result = await business.GetListProperty(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetProperty.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{PropertyId}")]
        public async Task<IActionResult> GetProperty(Int32 PropertyId)
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
				{"CompayId", null }
            };

            var result = await business.GetProperty(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PostProperty.
        /// </summary>
        /// <param name="model">The model<see cref="PropertyModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostProperty(PropertyModel model)
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
				{"CompayId", model.CompayId }
            };

            var result = await business.PostProperty(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PutProperty.
        /// </summary>
        /// <param name="model">The model<see cref="PropertyModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutProperty(PropertyModel model)
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
				{"CompayId", model.CompayId }
            };
            
            var result = await business.PutProperty(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The EnableProperty.
        /// </summary>
        /// <param name="model">The model<see cref="PropertyModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut("enable")]
        public async Task<IActionResult> EnableProperty(PropertyModel model)
        {
            Int32 UpdatedBy = 0;
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            if (identity != null)
            {
                UpdatedBy = Int32.Parse(identity.FindFirst("userId").Value);
            }

            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"PropertyId", model.PropertyId }
            };
            
            var result = await business.EnableProperty(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The DisableProperty.
        /// </summary>
        /// <param name="model">The model<see cref="PropertyModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut("disable")]
        public async Task<IActionResult> DisableProperty(PropertyModel model)
        {
            Int32 DisabledBy = 0;
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            if (identity != null)
            {
                DisabledBy = Int32.Parse(identity.FindFirst("userId").Value);
            }

            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"PropertyId", model.PropertyId }
            };
            
            var result = await business.DisableProperty(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The DeleteProperty.
        /// </summary>
        /// <param name="model">The model<see cref="PropertyModel"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{PropertyId}")]
        public async Task<IActionResult> DeleteProperty(Int32? PropertyId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"PropertyId", PropertyId }
            };

            var result = await business.DeleteProperty(parameters);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

    }
}

