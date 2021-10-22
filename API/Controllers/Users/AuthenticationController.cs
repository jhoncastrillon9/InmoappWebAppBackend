using Business.Users;
using Commons.DTOs;
using Commons.DTOs.Users;
using Commons.Resources;
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

                if (response.ExecutionError)
                    return Ok(new { data = "", executionError = true, message = response.Message });
                else
                {
                    Byte lAuthenticated = 0;
                    foreach (var item in response.Data)
                    {
                        lAuthenticated = item.Authenticated;
                    }

                    // Unauthorizad response
                    if (lAuthenticated == 0)
                    {
                        return Ok(new { data = response.Data, executionError = false, message = "" });
                    }
                    else
                    {
                        int userId = Convert.ToInt32(response.Data[0].UserId.ToString());
                        string userName = response.Data[0].Username.ToString() as string;
                        GenerateAuthentication(userId, userName, out JwtSecurityTokenHandler tokenHandler, out SecurityToken Token);

                        // Authentication response
                        return Ok(new { data = response.Data[0], token = tokenHandler.WriteToken(Token), executionError = false, message = "" });
                    }
                }
            }
            catch (Exception ex)
            {
                response.ExecutionError = true;
                response.Message = ex.Message;
                return new BadRequestObjectResult(response);
            }           

        }

        private string GenerateAuthentication(int userId, string userName, out JwtSecurityTokenHandler tokenHandler, out SecurityToken Token)
        {
            // Get SecretKey from appseting
            var secretKey = configuration.GetValue<string>("SecretKey");
            var key = Encoding.ASCII.GetBytes(secretKey);

            // Payload creation
            var claims = _AuthenticationServices.GetClaimsForUser(userId, userName);

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
            return tokenHandler.WriteToken(Token);
        }

        /// <summary>
        /// Registra al usuario (Crea un nuevo usuario)
        /// </summary>
        /// <param name="newUser"></param>
        /// <returns></returns>
        [HttpPost("register")]
        public async Task<IActionResult> Register([FromBody] AuthenticationDTO newUser)
        {
            try
            {             
                response = await _AuthenticationServices.Register(newUser);                
                string token = GenerateAuthentication(response.Data.UserId, response.Data.Username, out JwtSecurityTokenHandler tokenHandler, out SecurityToken Token);

                return Ok(new { response.Data, token, executionError = false, message = Messages.SuccessGeneral });
            }
            catch (Exception ex)
            {
                response.ExecutionError = true;
                response.Message = ex.Message;
                return new BadRequestObjectResult(response);
            }

        }

    }
}
