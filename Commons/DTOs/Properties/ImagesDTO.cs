using Commons;
using System;

namespace Commons.DTOs.Properties
{
    public class ImagesDTO : ResponseSpDTO
	{
		public Int32 ImageId { get; set; } 
		public String ImageName { get; set; }
		public String Path { get; set; }
		public Boolean? IsMain { get; set; }
		public Int32 PropertyId { get; set; }

    }

}
