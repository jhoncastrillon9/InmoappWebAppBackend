using Business.Resources;
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
        protected int userIdSession;
        protected int companyIdSession;


        protected void LoadUserSession()
        {
            ClaimsIdentity identity = HttpContext.User.Identity as ClaimsIdentity;
            if (identity != null)
            {
                userIdSession = int.Parse(identity.FindFirst("userId").Value);
                companyIdSession = int.Parse(identity.FindFirst("companyId").Value);
            }
        }

        protected void ValidateCompany(int companyId)
        {
            if (companyId != companyIdSession)
            {
                throw new Exception(Messages.ErrorEntityNoAutorizate);
            }
            
        }

        protected void ValidateUserId(int companyId)
        {
            if (companyId != userIdSession)
            {
                throw new Exception(Messages.ErrorEntityNoAutorizate);
            }

        }
    }
}
