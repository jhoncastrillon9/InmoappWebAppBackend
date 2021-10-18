using Commons.DTOs;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;

namespace Business.Users
{
    public class AuthenticationServices
    {
        private UserByRoleService _UserByRoleService;
        public AuthenticationServices(UserByRoleService userByRoleService)
        {
            _UserByRoleService = userByRoleService;
        }

        public List<Claim> GetClaimsForUser(ResponseMDTO response)
        {
            int userId = (int)response.data[0].UserId.ToString();
            var roles = _UserByRoleService.GetAllBy(x => x.UserId == userId).Select(x => x.Role.Name).ToList();

            // Payload creation
            var claims = new List<Claim>
            {
                        new Claim("userId", response.data[0].UserId.ToString() as string),
                        new Claim("username", response.data[0].Username.ToString() as string)
            };

            foreach (var rolName in roles)
            {
                claims.Add(new Claim(ClaimTypes.Role, rolName));
            }

            return claims;
        }
    }
}
