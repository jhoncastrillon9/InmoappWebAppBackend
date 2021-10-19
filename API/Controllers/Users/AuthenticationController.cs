using Business.Users;
using Commons.DTOs;
using Commons.DTOs.Users;
using DataAccess.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace API.Controllers
{

    /// <summary>
    /// Defines the <see cref="AuthenticationController" />.
    /// </summary>
    [Route("[controller]")]
    [ApiController]
    public class AuthenticationController : ControllerBase
    {
        private ResponseMDTO response = new ResponseMDTO();

        private AuthenticationServices _AuthenticationServices;

        /// <summary>
        /// Defines the configuration.
        /// </summary>
        private readonly IConfiguration configuration;
        /// <summary>
        /// Initializes a new instance of the <see cref="AuthenticationController"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public AuthenticationController(IConfiguration config, AuthenticationServices authenticationServices)
        {
            configuration = config;
            _AuthenticationServices = authenticationServices;
      
        }

        /// <summary>
        /// The Validate.
        /// </summary>
        /// <param name="data">The data<see cref="AuthenticationModel"/>.</param>
        /// <returns>The <see cref="Task{IActionResult}"/>.</returns>
        [HttpPost]
        public async Task<IActionResult> Validate([FromBody] AuthenticationDTO data)
        {
            try
            {
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>()
                {
                    {"Username", data.Username },
                    {"Password", data.Password  }
                };
                // DB user validation
                response = await _AuthenticationServices.Validate(parameters);

                if (response.executionError)
                    return Ok(new { data = "", executionError = true, message = response.message });
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
                        return Ok(new { data = response.data, executionError = false, message = "" });
                    }
                    else
                    {
                        JwtSecurityTokenHandler tokenHandler;
                        SecurityToken Token;
                        GenerateAuthentication(response, out tokenHandler, out Token);

                        // Authentication response
                        return Ok(new { data = response.data[0], token = tokenHandler.WriteToken(Token), executionError = false, message = "" });
                    }
                }
            }
            catch (Exception ex)
            {
                response.executionError = true;
                response.message = ex.Message;
                return new BadRequestObjectResult(response);
            }           

        }

        private void GenerateAuthentication(ResponseMDTO response, out JwtSecurityTokenHandler tokenHandler, out SecurityToken Token)
        {
            // Get SecretKey from appseting
            var secretKey = configuration.GetValue<string>("SecretKey");
            var key = Encoding.ASCII.GetBytes(secretKey);

            // Payload creation
            var claims = _AuthenticationServices.GetClaimsForUser(response);

            // Token configuration
            var tokenConfiguration = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(claims),
                // token duration
                Expires = DateTime.UtcNow.AddHours(1),
                // Token Signing Credential
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };

            tokenHandler = new JwtSecurityTokenHandler();
            Token = tokenHandler.CreateToken(tokenConfiguration);
        }

        /// <summary>
        /// Registra al usuario (Crea un nuevo usuario)
        /// </summary>
        /// <param name="newUser"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IActionResult> Register([FromBody] AuthenticationDTO newUser)
        {
            try
            {             
                response = await _AuthenticationServices.Register(newUser);
                return Ok(new { data = response.data[0], executionError = false, message = "" });
            }
            catch (Exception ex)
            {
                response.executionError = true;
                response.message = ex.Message;
                return new BadRequestObjectResult(response);
            }

        }

    }
}
