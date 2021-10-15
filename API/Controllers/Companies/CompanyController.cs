namespace API.Controllers
{
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Extensions.Configuration;
    using System;
    using System.Collections.Generic;
    using System.Security.Claims;
    using System.Threading.Tasks;

    using Business.Companies;
    using Entities.Companies;
    using Commons.DTOs.Companies;

    /// <summary>
    /// Defines the <see cref="CompanyController" />.
    /// </summary>
    [Authorize]
    [Route("Companies/[controller]")]
    [ApiController]
    public class CompanyController: ControllerBase
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly CompanyService business;
        private string spForRead = "Companies.Company_READ";
        private string spForList = "Companies.Company_LIST";
        private string spForCreate = "Companies.Company_CREATE";
        private string spForUpdate = "Companies.Company_UPDATE";
        private string spForDelete = "Companies.Company_DELETE";

        /// <summary>
        /// Initializes a new instance of the <see cref="CompanyController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public CompanyController(CompanyService companyService)
        {
            business = companyService;
        }

        /// <summary>
        /// The GetCompany.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet]
        public async Task<IActionResult> GetCompany(Int32? CompayId, String CompanyName, String Document, String Telephone, String Mobile, String Email, String Address, String Observation)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"CompayId", CompayId },
				{"CompanyName", CompanyName },
				{"Document", Document },
				{"Telephone", Telephone },
				{"Mobile", Mobile },
				{"Email", Email },
				{"Address", Address },
				{"Observation", Observation }
            };

            var result = await business.ExecStoreProcedure<CompanyDTO>(parameters, spForRead);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetCompany.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListCompany(Int32? CompayId, String CompanyName, String Document, String Telephone, String Mobile, String Email, String Address, String Observation)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"CompayId", CompayId },
				{"CompanyName", CompanyName },
				{"Document", Document },
				{"Telephone", Telephone },
				{"Mobile", Mobile },
				{"Email", Email },
				{"Address", Address },
				{"Observation", Observation }
            };

            var result = await business.ExecStoreProcedure<CompanyDTO>(parameters, spForList);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The GetCompany.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{CompayId}")]
        public async Task<IActionResult> GetCompany(Int32 CompayId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"Option", 1 },
				{"CompayId", CompayId },
				{"CompanyName", null },
				{"Document", null },
				{"Telephone", null },
				{"Mobile", null },
				{"Email", null },
				{"Address", null },
				{"Observation", null }
            };

            var result = await business.ExecStoreProcedure<CompanyDTO>(parameters, spForRead);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PostCompany.
        /// </summary>
        /// <param name="model">The model<see cref="CompanyEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostCompany(CompanyEntity model)
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
				{"CompanyName", model.CompanyName },
				{"Document", model.Document },
				{"Telephone", model.Telephone },
				{"Mobile", model.Mobile },
				{"Email", model.Email },
				{"Address", model.Address },
				{"Observation", model.Observation }
            };

            var result = await business.ExecStoreProcedure<CompanyDTO>(parameters, spForCreate);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The PutCompany.
        /// </summary>
        /// <param name="model">The model<see cref="CompanyEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutCompany(CompanyEntity model)
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
				{"CompayId", model.CompayId },
				{"CompanyName", model.CompanyName },
				{"Document", model.Document },
				{"Telephone", model.Telephone },
				{"Mobile", model.Mobile },
				{"Email", model.Email },
				{"Address", model.Address },
				{"Observation", model.Observation }
            };

            var result = await business.ExecStoreProcedure<CompanyDTO>(parameters, spForUpdate);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

        /// <summary>
        /// The DeleteCompany.
        /// </summary>
        /// <param name="model">The model<see cref="CompanyEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{CompayId}")]
        public async Task<IActionResult> DeleteCompany(Int32? CompayId)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
				{"CompayId", CompayId }
            };

            var result = await business.ExecStoreProcedure<CompanyDTO>(parameters, spForDelete);
            if (result.executionError)
            {
                return new BadRequestObjectResult(result);
            }
            return new OkObjectResult(result);
        }

    }
}

