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
    /// Defines the <see cref="TypeOfferController" />.
    /// </summary>
    [Authorize]
    [Route("Properties/[controller]")]
    [ApiController]
    public class TypeOfferController: ControllerBase
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly TypeOfferService business;
        private string spForRead = "Properties.TypeOffer_READ";
        private string spForList = "Properties.TypeOffer_LIST";
        private string spForCreate = "Properties.TypeOffer_CREATE";
        private string spForUpdate = "Properties.TypeOffers_UPDATE";
        private string spForDelete = "Properties.TypeOffer_DELETE";

        /// <summary>
        /// Initializes a new instance of the <see cref="TypeOfferController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public TypeOfferController(TypeOfferService typeOfferService)
        {
            business = typeOfferService;
        }

        /// <summary>
        /// The GetTypeOffer.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet]
        public async Task<IActionResult> GetTypeOffer(Int32? TypeOfferId, String TypeOfferName)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"TypeOfferId", TypeOfferId },
				{"TypeOfferName", TypeOfferName }
            };

            var result = await business.ExecStoreProcedure(parameters, spForRead);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetTypeOffer.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListTypeOffer(Int32? TypeOfferId, String TypeOfferName)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"TypeOfferId", TypeOfferId },
				{"TypeOfferName", TypeOfferName }
            };

            var result = await business.ExecStoreProcedure(parameters, spForList);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetTypeOffer.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{TypeOfferId}")]
        public async Task<IActionResult> GetTypeOffer(Int32 TypeOfferId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"TypeOfferId", TypeOfferId },
				{"TypeOfferName", null }
            };

            var result = await business.ExecStoreProcedure(parameters, spForRead);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PostTypeOffer.
        /// </summary>
        /// <param name="model">The model<see cref="TypeOfferEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostTypeOffer(TypeOfferEntity model)
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
				{"TypeOfferName", model.TypeOfferName }
            };

            var result = await business.ExecStoreProcedure(parameters, spForCreate);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PutTypeOffer.
        /// </summary>
        /// <param name="model">The model<see cref="TypeOfferEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutTypeOffer(TypeOfferEntity model)
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
				{"TypeOfferId", model.TypeOfferId },
				{"TypeOfferName", model.TypeOfferName }
            };

            var result = await business.ExecStoreProcedure(parameters, spForUpdate);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }


        /// <summary>
        /// The DeleteTypeOffer.
        /// </summary>
        /// <param name="model">The model<see cref="TypeOfferEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{TypeOfferId}")]
        public async Task<IActionResult> DeleteTypeOffer(Int32? TypeOfferId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"TypeOfferId", TypeOfferId }
            };

            var result = await business.ExecStoreProcedure(parameters, spForDelete);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

    }
}

