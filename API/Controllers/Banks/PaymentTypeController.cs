namespace API.Controllers
{
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Extensions.Configuration;
    using System;
    using System.Collections.Generic;
    using System.Security.Claims;
    using System.Threading.Tasks;
    using Business.Banks;
    using Commons.DTOs.Banks;

    /// <summary>
    /// Defines the <see cref="PaymentTypeController" />.
    /// </summary>
    [Authorize]
    [Route("Banks/[controller]")]
    [ApiController]
    public class PaymentTypeController: ControllerBase
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly PaymentTypeService business;
        private string spForRead = "Banks.PaymentType_READ";
        private string spForList = "Banks.PaymentTypes_LIST";
        private string spForCreate = "Banks.PaymentType_CREATE";
        private string spForUpdate = "Banks.PaymentType_UPDATE";
        private string spForDelete = "Banks.PaymentType_DELETE";

        /// <summary>
        /// Initializes a new instance of the <see cref="PaymentTypeController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public PaymentTypeController(PaymentTypeService paymentTypeService)
        {
            business = paymentTypeService;
        }

        /// <summary>
        /// The GetPaymentType.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet]
        public async Task<IActionResult> GetPaymentType(Int32? PaymentTypeId, String PaymentTypeName, Int32? CompayId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"PaymentTypeId", PaymentTypeId },
				{"PaymentTypeName", PaymentTypeName },
				{"CompayId", CompayId }
            };

            var result = await business.ExecStoreProcedure<PaymentTypeDTO>(parameters, spForRead);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetPaymentType.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListPaymentType(Int32? PaymentTypeId, String PaymentTypeName, Int32? CompayId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"PaymentTypeId", PaymentTypeId },
				{"PaymentTypeName", PaymentTypeName },
				{"CompayId", CompayId }
            };

            var result = await business.ExecStoreProcedure<PaymentTypeDTO>(parameters, spForList);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetPaymentType.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{PaymentTypeId}")]
        public async Task<IActionResult> GetPaymentType(Int32 PaymentTypeId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"PaymentTypeId", PaymentTypeId },
				{"PaymentTypeName", null },
				{"CompayId", null }
            };

            var result = await business.ExecStoreProcedure<PaymentTypeDTO>(parameters, spForRead);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PostPaymentType.
        /// </summary>
        /// <param name="model">The model<see cref="PaymentTypeEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostPaymentType(PaymentTypeDTO model)
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
				{"PaymentTypeName", model.PaymentTypeName },
				{"CompayId", model.CompayId }
            };

            var result = await business.ExecStoreProcedure<PaymentTypeDTO>(parameters, spForCreate);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PutPaymentType.
        /// </summary>
        /// <param name="model">The model<see cref="PaymentTypeEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutPaymentType(PaymentTypeDTO model)
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
				{"PaymentTypeId", model.PaymentTypeId },
				{"PaymentTypeName", model.PaymentTypeName },
				{"CompayId", model.CompayId }
            };

            var result = await business.ExecStoreProcedure<PaymentTypeDTO>(parameters, spForUpdate);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }       

        /// <summary>
        /// The DeletePaymentType.
        /// </summary>
        /// <param name="model">The model<see cref="PaymentTypeEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{PaymentTypeId}")]
        public async Task<IActionResult> DeletePaymentType(Int32? PaymentTypeId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"PaymentTypeId", PaymentTypeId }
            };

            var result = await business.ExecStoreProcedure<PaymentTypeDTO>(parameters, spForDelete);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

    }
}

