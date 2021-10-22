namespace API.Controllers
{
    using Business.Contracts;
    using Commons.DTOs.Contracts;
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Http;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Extensions.Configuration;
    using System;
    using System.Collections.Generic;
    using System.Security.Claims;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="ContractController" />.
    /// </summary>
    [Authorize(Roles = "SuperAdmin,CompanyAdmin,ContractUser")]
    [Route("Contracts/[controller]")]
    [ApiController]
    public class ContractController : BaseController
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly ContractService _ContractService;
        private readonly string spForRead = "Contracts.Contract_READ";
        private readonly string spForList = "Contracts.Contract_LIST";
        private readonly string spForCreate = "Contracts.Contract_CREATE";
        private readonly string spForUpdate = "Contracts.Contract_UPDATE";
        private readonly string spForDelete = "Contracts.Contract_DELETE";

        /// <summary>
        /// Initializes a new instance of the <see cref="ContractController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public ContractController(ContractService contractService, IHttpContextAccessor httpContext) : base(httpContext)
        {
            _ContractService = contractService;
        }

        /// <summary>
        /// The GetContract.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet]
        public async Task<IActionResult> GetContract(Int32? ContractId, String Observation, Int32? StatusId, Int32? PropertyId, Int32? TenantId, Int32? CompayId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"ContractId", ContractId },
                {"Observation", Observation },
                {"StatusId", StatusId },
                {"PropertyId", PropertyId },
                {"TenantId", TenantId },
                {"CompayId", currentUserCompanyId }
            };

                response = await _ContractService.ExecStoreProcedure<ContractDTO>(parameters, spForRead);
               
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
        /// The GetContract.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListContract(Int32? ContractId, String Observation, Int32? StatusId, Int32? PropertyId, Int32? TenantId, Int32? CompayId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"ContractId", ContractId },
                    {"Observation", Observation },
                    {"StatusId", StatusId },
                    {"PropertyId", PropertyId },
                    {"TenantId", TenantId },
                    {"CompayId", currentUserCompanyId }
                };

                response = await _ContractService.ExecStoreProcedure<ContractDTO>(parameters, spForList);
               
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
        /// The GetContract.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{ContractId}")]
        public async Task<IActionResult> GetContract(Int32 ContractId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"ContractId", ContractId },
                {"Observation", null },
                {"StatusId", null },
                {"PropertyId", null },
                {"TenantId", null },
                {"CompayId", currentUserCompanyId }
            };

                response = await _ContractService.ExecStoreProcedure<ContractDTO>(parameters, spForRead);
               
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
        /// The PostContract.
        /// </summary>
        /// <param name="model">The model<see cref="ContractEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostContract(ContractDTO model)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"ContractDate", model.ContractDate },
                    {"InnitialDate", model.InnitialDate },
                    {"QuantityMonths", model.QuantityMonths },
                    {"RentalFeeForOwner", model.RentalFeeForOwner },
                    {"RentalFeeForTennat", model.RentalFeeForTennat },
                    {"Observation", model.Observation },
                    {"StatusId", model.StatusId },
                    {"PropertyId", model.PropertyId },
                    {"TenantId", model.TenantId },
                    {"CompayId", currentUserCompanyId }
                };

                response = await _ContractService.ExecStoreProcedure<ContractDTO>(parameters, spForCreate);
               
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
        /// The PutContract.
        /// </summary>
        /// <param name="model">The model<see cref="ContractEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutContract(ContractDTO model)
        {
            try
            {
                
                _ContractService.ValidateCompany(_ContractService.FindById(model.ContractId).CompayId);
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Option", 1 },
                    {"ContractId", model.ContractId },
                    {"ContractDate", model.ContractDate },
                    {"InnitialDate", model.InnitialDate },
                    {"QuantityMonths", model.QuantityMonths },
                    {"RentalFeeForOwner", model.RentalFeeForOwner },
                    {"RentalFeeForTennat", model.RentalFeeForTennat },
                    {"Observation", model.Observation },
                    {"StatusId", model.StatusId },
                    {"PropertyId", model.PropertyId },
                    {"TenantId", model.TenantId },
                    {"CompayId", model.CompayId }
                };

                response = await _ContractService.ExecStoreProcedure<ContractDTO>(parameters, spForUpdate);
              
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
        /// The DeleteContract.
        /// </summary>
        /// <param name="model">The model<see cref="ContractEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{ContractId}")]
        public async Task<IActionResult> DeleteContract(Int32? ContractId)
        {
            try
            {
                
                _ContractService.ValidateCompany(_ContractService.FindById(ContractId).CompayId);
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"ContractId", ContractId }
                };

                var result = await _ContractService.ExecStoreProcedure<ContractDTO>(parameters, spForDelete);
              
                return new OkObjectResult(result);

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

