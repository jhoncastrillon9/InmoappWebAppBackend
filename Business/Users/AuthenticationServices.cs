using AutoMapper;
using Commons.DTOs;
using Commons.DTOs.Users;
using Commons.Enums.Users;
using DataAccess;
using DataAccess.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using RoleEmun = Commons.Enums.Users.RoleEmun;

namespace Business.Users
{
    public class AuthenticationServices
    {
        private readonly IMapper _mapper;
        private UserByRoleService _UserByRoleService;
        private UserService _Userservice;
        private BaseStoreProcedureModel _SpModel;
        protected ResponseMDTO response = new ResponseMDTO();
        public AuthenticationServices(
            UserByRoleService userByRoleService, 
            BaseStoreProcedureModel spModel, 
            UserService userService,
            IMapper mapper)
        {
            _UserByRoleService = userByRoleService;
            _SpModel = spModel;
            _Userservice = userService;
            _mapper = mapper;
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

        /// <summary>
        /// Registrar un usuario nuevo 
        /// </summary>
        /// <param name="dto">AuthenticationDTO</param>
        /// <returns></returns>
        public async Task<ResponseMDTO> Register(AuthenticationDTO dto)
        {
            var newUser = new User
            {
                FirstName = dto.FirstName,
                LastName = string.Empty,
                Username = dto.Email,
                Password = dto.Password,
                Active = true,
                CreatedAt = DateTime.Now,
                UpdatedAt = DateTime.Now,
                UserTypeId = (int)UserTypeEnum.Prod
            };

            newUser.Company = new Company
            {
                CompanyName = dto.CompanyName,
                Email = dto.Email
            };

            newUser.UserByRole = new List<UserByRole> { new UserByRole {
                    UserId = newUser.UserId,
                    RoleId = (int)RoleEmun.CompanyAdmin
                }};
                        
            response.data = _mapper.Map<UserDTO>(_Userservice.Create(newUser));
            return response;

        }
    }
}
