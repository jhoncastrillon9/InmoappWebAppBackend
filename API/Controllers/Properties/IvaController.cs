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
    using Commons.DTOs.Properties;

    /// <summary>
    /// Defines the <see cref="IvaController" />.
    /// </summary>
    [Authorize]
    [Route("Properties/[controller]")]
    [ApiController]
    public class IvaController: ControllerBase
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly IvaService business;
        private string spForRead = "Properties.Iva_READ";
        private string spForList = "Properties.Iva_LIST";
        private string spForCreate = "Properties.Iva_CREATE";
        private string spForUpdate = "Properties.Iva_UPDATE";
        private string spForDelete = "Properties.Iva_DELETE";

        /// <summary>
        /// Initializes a new instance of the <see cref="IvaController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public IvaController(IvaService ivaService)
        {
            business = ivaService;
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
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"IvaId", IvaId }
            };

            var result = await business.ExecStoreProcedure<IvaDTO>(parameters, spForRead);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
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
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"IvaId", IvaId }
            };

            var result = await business.ExecStoreProcedure<IvaDTO>(parameters, spForList);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetIva.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{IvaId}")]
        public async Task<IActionResult> GetIva(Int32 IvaId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"IvaId", IvaId }
            };

            var result = await business.ExecStoreProcedure<IvaDTO>(parameters, spForRead);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PostIva.
        /// </summary>
        /// <param name="model">The model<see cref="IvaEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostIva(IvaEntity model)
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
				{"Valor", model.Valor }
            };

            var result = await business.ExecStoreProcedure<IvaDTO>(parameters, spForCreate);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PutIva.
        /// </summary>
        /// <param name="model">The model<see cref="IvaEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutIva(IvaEntity model)
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
				{"IvaId", model.IvaId },
				{"Valor", model.Valor }
            };

            var result = await business.ExecStoreProcedure<IvaDTO>(parameters, spForUpdate);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }


        /// <summary>
        /// The DeleteIva.
        /// </summary>
        /// <param name="model">The model<see cref="IvaEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{IvaId}")]
        public async Task<IActionResult> DeleteIva(Int32? IvaId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"IvaId", IvaId }
            };

            var result = await business.ExecStoreProcedure<IvaDTO>(parameters, spForDelete);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

    }
}

