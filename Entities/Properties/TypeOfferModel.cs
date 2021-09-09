using System;

namespace Entities.Properties
{
    public class TypeOfferModel
    {
		public Int32 TypeOfferId { get; set; }
		public String TypeOfferName { get; set; }

    }

    public class TypeOfferListModel
    {
		public Int32 TypeOfferId { get; set; }
		public String TypeOfferName { get; set; }

    }

    public class TypeOfferPostModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 TypeOfferId { get; set; }

    }

    public class TypeOfferPutModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 TypeOfferId { get; set; }

    }


    public class TypeOfferDeleteModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 TypeOfferId { get; set; }

    }

}
