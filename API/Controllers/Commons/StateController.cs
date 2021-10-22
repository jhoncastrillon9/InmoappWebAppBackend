namespace API.Controllers
{
    using Business.Commons;
    using Commons.DTOs.Commons;
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Http;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Extensions.Configuration;
    using System;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="StateController" />.
    /// </summary>
    [Authorize(Roles = "SuperAdmin")]
    [Route("Commons/[controller]")]
    [ApiController]
    public class StateController : BaseController
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly StateService _StateService;
        private readonly string spForRead = "Commons.State_READ";
        private readonly string spForList = "Commons.State_LIST";
        private readonly string spForCreate = "Commons.State_CREATE";
        private readonly string spForUpdate = "Commons.State_UPDATE";
        private readonly string spForDelete = "Commons.State_DELETE";

        /// <summary>
        /// Initializes a new instance of the <see cref="StateController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public StateController(StateService stateService, IHttpContextAccessor httpContext) : base(httpContext)
        {
            _StateService = stateService;
        }

        /// <summary>
        /// The GetState.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet]
        public async Task<IActionResult> GetState(Int32? StateId, String StateName)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"StateId", StateId },
                {"StateName", StateName }
            };

                response = await _StateService.ExecStoreProcedure<StateDTO>(parameters, spForRead);

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
        /// The GetState.
        /// </summary>
        /// <param name="ProjectId">The ProjectId<see cref="int?"/>.</param>
        /// <param name="ProjectName">The ProjectName<see cref="string"/>.</param>
        /// <param name="Active">The Activo<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("list")]
        public async Task<IActionResult> GetListState(Int32? StateId, String StateName)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"StateId", StateId },
                {"StateName", StateName }
            };

                response = await _StateService.ExecStoreProcedure<StateDTO>(parameters, spForList);

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
        /// The GetState.
        /// </summary>
        /// <param name="id">The ProjectId<see cref="int?"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpGet("{StateId}")]
        public async Task<IActionResult> GetState(Int32 StateId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"StateId", StateId },
                {"StateName", null }
            };

                response = await _StateService.ExecStoreProcedure<StateDTO>(parameters, spForRead);

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
        /// The PostState.
        /// </summary>
        /// <param name="model">The model<see cref="StateEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> PostState(StateDTO model)
        {
            try
            {
                

                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"StateName", model.StateName }
            };

                response = await _StateService.ExecStoreProcedure<StateDTO>(parameters, spForCreate);

                return new OkObjectResult(response);

            }
            catch (ApplicationException ex)
            {
                base.response.executionError = true;
                base.response.message = ex.Message;
                return new BadRequestObjectResult(base.response);
            }
            catch (Exception ex)
            {
                base.response.executionError = true;
                return new BadRequestObjectResult(base.response);
            }


        }

        /// <summary>
        /// The PutState.
        /// </summary>
        /// <param name="model">The model<see cref="StateEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpPut]
        public async Task<IActionResult> PutState(StateDTO model)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Option", 1 },
                {"StateId", model.StateId },
                {"StateName", model.StateName }
            };

                response = await _StateService.ExecStoreProcedure<StateDTO>(parameters, spForUpdate);

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
        /// The DeleteState.
        /// </summary>
        /// <param name="model">The model<see cref="StateEntity"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        [HttpDelete("{StateId}")]
        public async Task<IActionResult> DeleteState(Int32? StateId)
        {
            try
            {
                
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"StateId", StateId }
            };

                response = await _StateService.ExecStoreProcedure<StateDTO>(parameters, spForDelete);

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

    }
}

