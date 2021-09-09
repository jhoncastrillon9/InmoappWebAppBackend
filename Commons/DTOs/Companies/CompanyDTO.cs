using System;

namespace Commons.DTOs.Companies
{
    public class CompanyDTO : ResponseSpDTO
	{
		public Int32 CompayId { get; set; }
		public String CompanyName { get; set; }
		public String Document { get; set; }
		public String Telephone { get; set; }
		public String Mobile { get; set; }
		public String Email { get; set; }
		public String Address { get; set; }
		public String Observation { get; set; }

    }

}
