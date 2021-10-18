using Commons.DTOs;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace API.Controllers
{

    public class BaseController : ControllerBase
    {

        protected ResponseMDTO response = new ResponseMDTO();
        protected int userIdSession;


        protected void LoadUserSession()
        {
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            if (identity != null)
            {
                userIdSession = int.Parse(identity.FindFirst("userId").Value);
            }
        }
    }
}
