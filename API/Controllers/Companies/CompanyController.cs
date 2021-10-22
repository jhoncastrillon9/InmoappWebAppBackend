namespace API.Controllers
{
    using Business.Companies;
    using Business.Users;
    using Commons.DTOs.Companies;
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Http;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Extensions.Configuration;
    using System;
    using System.Collections.Generic;
    using System.Security.Claims;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="CompanyController" />.
    /// </summary>   
    [Authorize(Roles = "SuperAdmin,CompanyAdmin")]
    [Route("Companies/[controller]")]
    [ApiController]
    public class CompanyController : BaseController
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly CompanyService _CompanyService;
        private readonly UserService _Userservice;
        private readonly string spForRead = "Companies.Company_READ";
        private readonly string spForList = "Companies.Company_LIST";
        private readonly string spForCreate = "Companies.Company_CREATE";
        private readonly string spForUpdate = "Companies.Company_UPDATE";
        private readonly string spForDelete = "Companies.Company_DELETE";

        /// <summary>
        /// Initializes a new instance of the <see cref="CompanyController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public CompanyController(CompanyService companyService, UserService userService, IHttpContextAccessor httpContext) : base(httpContext)
        {
            _CompanyService = companyService;
            _Userservice = userService;
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
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"CompayId", currentUserCompanyId },
                    {"CompanyName", CompanyName },
                    {"Document", Document },
                    {"Telephone", Telephone },
                    {"Mobile", Mobile },
                    {"Email", Email },
                    {"Address", Address },
                    {"Observation", Observation }
                };

                response = await _CompanyService.ExecStoreProcedure<CompanyDTO>(parameters, spForRead);

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
        /// The GetCompany.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListCompany(Int32? CompayId, String CompanyName, String Document, String Telephone, String Mobile, String Email, String Address, String Observation)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"CompayId", currentUserCompanyId },
                    {"CompanyName", CompanyName },
                    {"Document", Document },
                    {"Telephone", Telephone },
                    {"Mobile", Mobile },
                    {"Email", Email },
                    {"Address", Address },
                    {"Observation", Observation }
                };

                response = await _CompanyService.ExecStoreProcedure<CompanyDTO>(parameters, spForList);

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
        /// The GetCompany.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{CompayId}")]
        public async Task<IActionResult> GetCompany(Int32 CompayId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"CompayId", currentUserCompanyId },
                    {"CompanyName", null },
                    {"Document", null },
                    {"Telephone", null },
                    {"Mobile", null },
                    {"Email", null },
                    {"Address", null },
                    {"Observation", null }
                };

                response = await _CompanyService.ExecStoreProcedure<CompanyDTO>(parameters, spForRead);

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
        /// The PostCompany.
        /// </summary>
        /// <param name="model">The model<see cref="CompanyEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [Authorize(Roles = "SuperAdmin")]
        [HttpPost]
        public async Task<IActionResult> PostCompany(CompanyDTO model)
        {
            try
            {
                
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

                var result = await _CompanyService.ExecStoreProcedure<CompanyDTO>(parameters, spForCreate);

                return new OkObjectResult(result);

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
        /// The PutCompany.
        /// </summary>
        /// <param name="model">The model<see cref="CompanyEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutCompany(CompanyDTO model)
        {
            try
            {
                
                ValidateCompany(model.CompayId);
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"CompayId", currentUserCompanyId },
                    {"CompanyName", model.CompanyName },
                    {"Document", model.Document },
                    {"Telephone", model.Telephone },
                    {"Mobile", model.Mobile },
                    {"Email", model.Email },
                    {"Address", model.Address },
                    {"Observation", model.Observation }
                };

                response = await _CompanyService.ExecStoreProcedure<CompanyDTO>(parameters, spForUpdate);

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
        /// The DeleteCompany.
        /// </summary>
        /// <param name="model">The model<see cref="CompanyEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [Authorize(Roles ="SuperAdmin")]
        [HttpDelete("{CompayId}")]
        public async Task<IActionResult> DeleteCompany(Int32? CompayId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"CompayId", CompayId }
            };

                var result = await _CompanyService.ExecStoreProcedure<CompanyDTO>(parameters, spForDelete);
     
                return new OkObjectResult(result);

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

