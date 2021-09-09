using System;

namespace Entities.Owners
{
    public class OwnerModel
    {
		public Int32 OwnerId { get; set; }
		public String OwnerName { get; set; }
		public String Document { get; set; }
		public String Telephone { get; set; }
		public String Mobile { get; set; }
		public String Email { get; set; }
		public String Address { get; set; }
		public String Observation { get; set; }
		public Int32 CompayId { get; set; }

    }

    public class OwnerListModel
    {
		public Int32 OwnerId { get; set; }
		public String OwnerName { get; set; }

    }

    public class OwnerPostModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 OwnerId { get; set; }

    }

    public class OwnerPutModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 OwnerId { get; set; }

    }


    public class OwnerDeleteModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 OwnerId { get; set; }

    }

}
