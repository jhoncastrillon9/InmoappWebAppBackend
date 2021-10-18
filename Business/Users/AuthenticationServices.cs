using CodeMono.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Business.Users
{
    public class AuthenticationServices
    {
        public void GenerateAuthentication(ResponseModel response, out JwtSecurityTokenHandler tokenHandler, out SecurityToken Token)
        {
            // Get SecretKey from appseting
            var secretKey = configuration.GetValue<string>("SecretKey");
            var key = Encoding.ASCII.GetBytes(secretKey);

            // Payload creation
            var claims = new[]
            {
                        new Claim("userId", response.data[0].UserId.ToString() as string),
                        new Claim("username", response.data[0].Username.ToString() as string),
                        new Claim(ClaimTypes.Role, "Admin")
                    };

            // Token configuration
            var tokenConfiguration = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(claims),
                // token duration
                Expires = DateTime.UtcNow.AddDays(1),
                // Token Signing Credential
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };

            tokenHandler = new JwtSecurityTokenHandler();
            Token = tokenHandler.CreateToken(tokenConfiguration);
        }
    }
}
