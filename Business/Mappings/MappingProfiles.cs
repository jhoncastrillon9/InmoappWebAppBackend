using AutoMapper;
using Commons.DTOs.Users;
using DataAccess.Data;
using System;
using System.Collections.Generic;
using System.Text;

namespace Business.Mappings
{
    public class MappingProfiles: Profile
    {
        public MappingProfiles()
        {
            CreateMap<User, UserDTO>().ReverseMap();      
        }
    }
}
