using System;
using System.Collections.Generic;
using System.Text;

namespace Commons.DTOs.Users
{
    /// <summary>
    /// DTO con lo que responde el SP
    /// </summary>
    public class AuthenticationResponseDTO
    {
        public Byte Authenticated { get; set; }
        public string Message { get; set; }
        public int UserId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public Int16 UserTypeId { get; set; }
        public string Username { get; set; }
        public string Avatar { get; set; }
        public int CompanyId { get; set; }
        public string CompanyName { get; set; }
        public List<int> Roles { get; set; }
    }
}
