using Commons.Enums.Users;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace API.Controllers._CodeMono
{

    public class AuthorizeRoleAttribute: AuthorizeAttribute
    {
        private List<Role> allowedRoles = new List<Role>();
        private int userId =0;

        public AuthorizeRoleAttribute(List<Role> roles)
        {
            allowedRoles = roles;
        }
        public void OnAuthorization(AuthorizationFilterContext context)
        {
            if (allowedRoles.Count != 0)
            {
                var identity = context.HttpContext.User.Identity as ClaimsIdentity;
                if (identity != null)            
                    userId = int.Parse(identity.FindFirst("userId").Value);
                //cargar los roles de la bd del usuario
                //var userRoles = 
                //luego comparar si lel usuario si tiene ese rol en bd con el solicitado ene l stributo 

                //en los controladores ya se debe empezar a utilizar esta clase de atributo como atributo de conrtrolador 
                // verificar y probar si algo llamar al base y luego hacer esta comprobación. base.onauthotixation()
                //var hasClaim = context.HttpContext.User.Claims.Any(c => c.Type == _claim.Type && c.Value == _claim.Value);


                //if (!hasClaim)
                //{
                //    context.Result = new ForbidResult();
                //}
            }
        }
    }
}
