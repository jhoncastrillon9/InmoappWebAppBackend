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
    /// Defines the <see cref="TypeOfferController" />.
    /// </summary>
    [Authorize(Roles = "SuperAdmin")]
    [Route("Properties/[controller]")]
    [ApiController]
    public class TypeOfferController : BaseController
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly TypeOfferService _TypeOfferService;
        private readonly string spForRead = "Properties.TypeOffer_READ";
        private readonly string spForList = "Properties.TypeOffer_LIST";
        private readonly string spForCreate = "Properties.TypeOffer_CREATE";
        private readonly string spForUpdate = "Properties.TypeOffers_UPDATE";
        private readonly string spForDelete = "Properties.TypeOffer_DELETE";

        /// <summary>
        /// Initializes a new instance of the <see cref="TypeOfferController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public TypeOfferController(TypeOfferService typeOfferService, ILogger<TypeOfferController> logger, IHttpContextAccessor httpContext) : base(httpContext, logger)
        {
            _TypeOfferService = typeOfferService;
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
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"TypeOfferId", TypeOfferId },
                    {"TypeOfferName", TypeOfferName }
                };

                response = await _TypeOfferService.ExecStoreProcedure<TypeOfferDTO>(parameters, spForRead);

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
        /// The GetTypeOffer.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListTypeOffer(Int32? TypeOfferId, String TypeOfferName)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"TypeOfferId", TypeOfferId },
                    {"TypeOfferName", TypeOfferName }
                };

                response = await _TypeOfferService.ExecStoreProcedure<TypeOfferDTO>(parameters, spForList);

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
        /// The GetTypeOffer.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{TypeOfferId}")]
        public async Task<IActionResult> GetTypeOffer(Int32 TypeOfferId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"TypeOfferId", TypeOfferId },
                    {"TypeOfferName", null }
                };

                response = await _TypeOfferService.ExecStoreProcedure<TypeOfferDTO>(parameters, spForRead);

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
        /// The PostTypeOffer.
        /// </summary>
        /// <param name="model">The model<see cref="TypeOfferEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostTypeOffer(TypeOfferDTO model)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"TypeOfferName", model.TypeOfferName }
                };

                var response = await _TypeOfferService.ExecStoreProcedure<TypeOfferDTO>(parameters, spForCreate);
              
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
        /// The PutTypeOffer.
        /// </summary>
        /// <param name="model">The model<see cref="TypeOfferEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutTypeOffer(TypeOfferDTO model)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"TypeOfferId", model.TypeOfferId },
                    {"TypeOfferName", model.TypeOfferName }
                };

                response = await _TypeOfferService.ExecStoreProcedure<TypeOfferDTO>(parameters, spForUpdate);

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
        /// The DeleteTypeOffer.
        /// </summary>
        /// <param name="model">The model<see cref="TypeOfferEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{TypeOfferId}")]
        public async Task<IActionResult> DeleteTypeOffer(Int32? TypeOfferId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"TypeOfferId", TypeOfferId }
                };

                response = await _TypeOfferService.ExecStoreProcedure<TypeOfferDTO>(parameters, spForDelete);

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

