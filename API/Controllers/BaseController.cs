using Commons.DTOs;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Security.Claims;

namespace API.Controllers
{

    public class BaseController : ControllerBase
    {

        protected ResponseMDTO response = new ResponseMDTO();
        protected int currentUserId;
        protected int currentCompanyIdUser;
        protected ClaimsIdentity _ClaimsUser;

        public BaseController(IHttpContextAccessor _HttpContext)
        {
            _ClaimsUser = _HttpContext.HttpContext.User.Identity as ClaimsIdentity;
            currentUserId = int.Parse(_ClaimsUser.FindFirst("userId").Value);
            currentCompanyIdUser = int.Parse(_ClaimsUser.FindFirst("companyId").Value);
        }  

    }
}
