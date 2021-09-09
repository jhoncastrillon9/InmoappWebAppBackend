using System;

namespace Entities.Companies
{
    public class CompanyModel
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

    public class CompanyListModel
    {
		public Int32 CompanyId { get; set; }
		public String CompanyName { get; set; }

    }

    public class CompanyPostModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 CompayId { get; set; }

    }

    public class CompanyPutModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 CompayId { get; set; }

    }


    public class CompanyDeleteModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 CompayId { get; set; }

    }

}
