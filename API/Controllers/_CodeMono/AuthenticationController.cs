using System.IdentityModel.Tokens.Jwt;
using Microsoft.IdentityModel.Tokens;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using CodeMono.Business;
using CodeMono.Entities;

namespace API.Controllers
{

    /// <summary>
    /// Defines the <see cref="AuthenticationController" />.
    /// </summary>
    [Route("[controller]")]
    [ApiController]
    public class AuthenticationController : ControllerBase
    {
        /// <summary>
        /// Defines the business.
        /// </summary>
        private readonly AuthenticationService business;

        /// <summary>
        /// Defines the configuration.
        /// </summary>
        private readonly IConfiguration configuration;

        /// <summary>
        /// Initializes a new instance of the <see cref="AuthenticationController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public AuthenticationController(IConfiguration config)
        {
            business = new AuthenticationService(config);
            configuration = config;
        }

        /// <summary>
        /// The Validate.
        /// </summary>
        /// <param name="data">The data<see cref="AuthenticationModel"/>.</param>
        /// <returns>The <see cref="Task{IActionResult}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> Validate([FromBody] AuthenticationModel data)
        {
            Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
            {
                {"Username", data.Username },
                {"Password", data.Password  }
            };
            // DB user validation
            var response = await business.Validate(parameters);

            if (response.executionError)
            {
                return Ok(new
                {
                    data = "",
                    executionError = true,
                    message = response.message
                });
            }
            else
            {
                Byte lAuthenticated = 0;
                foreach (var item in response.data)
                {
                    lAuthenticated = item.Authenticated;
                }

                // Unauthorizad response
                if (lAuthenticated == 0)
                {
                    return Ok(new
                    {
                        data = response.data,
                        executionError = false,
                        message = ""
                    });
                }
                else
                {
                    JwtSecurityTokenHandler tokenHandler;
                    SecurityToken Token;
                    GenerateAuthentication(response, out tokenHandler, out Token);

                    // Authentication response
                    return Ok(new
                    {
                        data = response.data[0],
                        token = tokenHandler.WriteToken(Token),
                        executionError = false,
                        message = ""
                    });
                }
            }

        }        
    }
}
