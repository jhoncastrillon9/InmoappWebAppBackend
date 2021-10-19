using System;
using System.Collections.Generic;
using System.Text;

namespace Commons.DTOs.Users
{
    public class AuthenticationDTO
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public string CompanyName { get; set; }

    }
}
