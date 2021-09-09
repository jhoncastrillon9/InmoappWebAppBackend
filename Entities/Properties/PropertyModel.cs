using System;

namespace Entities.Properties
{
    public class PropertyModel
    {
		public Int32 PropertyId { get; set; }
		public Int32? IdIva { get; set; }
		public String Code { get; set; }
		public String Title { get; set; }
		public String Description { get; set; }
		public String Address { get; set; }
		public Decimal PriceOwner { get; set; }
		public Decimal? Percentage { get; set; }
		public Decimal? FeeCompany { get; set; }
		public DateTime? RecruitmentDate { get; set; }
		public Decimal FinalPrice { get; set; }
		public Int32? Rooms { get; set; }
		public Int32? Toilets { get; set; }
		public Boolean? Reception { get; set; }
		public Boolean? Pool { get; set; }
		public Decimal? Area { get; set; }
		public String Observation { get; set; }
		public Int32 PropertyStatusId { get; set; }
		public Int32 CityId { get; set; }
		public Int32 ZoneId { get; set; }
		public Int32 OwnerId { get; set; }
		public Int32 PropertyCategoryId { get; set; }
		public Int32 TypeOfferId { get; set; }
		public Int32 CompayId { get; set; }

    }

    public class PropertyListModel
    {
		public Int32 PropertyId { get; set; }
		public String PropertyName { get; set; }

    }

    public class PropertyPostModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 PropertyId { get; set; }

    }

    public class PropertyPutModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 PropertyId { get; set; }

    }


    public class PropertyDeleteModel
    {
		public Int16 ErrorId { get; set; }
		public String Message { get; set; }
		public Int32 PropertyId { get; set; }

    }

}
