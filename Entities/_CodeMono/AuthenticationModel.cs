using System;

namespace CodeMono.Entities
{
    public class AuthenticationModel
    {
        public string Username { get; set; }
        public string Password { get; set; }
    }

    public class AuthenticationResponse
    {
        public Byte Authenticated { get; set; }
        public string Message { get; set; }
        public int UserId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public Int16 UserTypeId { get; set; }
        public string Username { get; set; }
        public string Avatar { get; set; }
    }
}
