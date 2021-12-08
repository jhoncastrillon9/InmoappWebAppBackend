using AutoMapper;
using Business.Companies;
using Commons.DTOs;
using Commons.DTOs.Users;
using Commons.Enums.Users;
using Commons.Resources;
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
        private readonly UserByRoleService _UserByRoleService;
        private readonly CompanyService _CompanyService;
        private readonly UserService _Userservice;
        private readonly BaseStoreProcedureModel _SpModel;
        protected ResponseMDTO response = new ResponseMDTO();
        public AuthenticationServices(
            UserByRoleService userByRoleService, 
            BaseStoreProcedureModel spModel, 
            UserService userService,
            CompanyService companyService,
            IMapper mapper)
        {
            _UserByRoleService = userByRoleService;
            _SpModel = spModel;
            _Userservice = userService;
            _mapper = mapper;
            _CompanyService = companyService;
        }

        /// <summary>
        /// The Validate.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseMDTO> Validate(Dictionary<string, dynamic> parameters)
        {
           
                var userData = await _SpModel.ExecStoreProcedure<AuthenticationResponseDTO>(parameters, "[CodeMono].[User_Authentication]");
                userData.FirstOrDefault().Roles = _UserByRoleService.GetAllBy(x => x.UserId == userData.FirstOrDefault().UserId)
                                                    .Select(x => x.RoleId).ToList();
                response.Data = userData;
                response.ExecutionError = false;
                response.Message = Messages.SuccessGeneral;
           
            return response;
        }


        public List<Claim> GetClaimsForUser(int userId, string userName)
        {
           
            var roles = _UserByRoleService.GetAllBy(x => x.UserId == userId).Select(x => x.Role.Name).ToList();
            int companyId = _Userservice.FindById(userId).CompanyId;

            // Payload creation
            var claims = new List<Claim>
            {
                        new Claim("userId", userId.ToString()),
                        new Claim("username", userName),
                        new Claim("companyId", companyId.ToString())
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
                 
            var userCreated = _mapper.Map<AuthenticationResponseDTO>(_Userservice.Create(newUser));
            userCreated.Authenticated = 1;
            response.Data = userCreated;
            return response;

        }
    }
}
