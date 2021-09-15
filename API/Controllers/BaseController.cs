using CodeMono.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace API.Controllers
{
    
    public class BaseController : ControllerBase
    {

        protected ResponseModel response = new ResponseModel();
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
