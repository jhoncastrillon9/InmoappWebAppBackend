using Commons.DTOs;
using Commons.DTOs.Users;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace Business.Users
{
    public class AuthenticationServices
    {
        private UserByRoleService _UserByRoleService;
        private BaseStoreProcedureModel _SpModel;
        protected ResponseMDTO response = new ResponseMDTO();
        public AuthenticationServices(UserByRoleService userByRoleService, BaseStoreProcedureModel spModel)
        {
            _UserByRoleService = userByRoleService;
            _SpModel = spModel;
        }

        /// <summary>
        /// The Validate.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseMDTO> Validate(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await _SpModel.ExecStoreProcedure<AuthenticationResponseDTO>(parameters, "[CodeMono].[User_Authentication]");
                response.data = res;
                response.executionError = false;
                response.message = "";
            }
            catch (Exception ex)
            {
                response.data = null;
                response.executionError = true;
                response.message = ex.Message;
            }
            return response;
        }


        public List<Claim> GetClaimsForUser(ResponseMDTO response)
        {
            int userId = Convert.ToInt32(response.data[0].UserId.ToString());
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
