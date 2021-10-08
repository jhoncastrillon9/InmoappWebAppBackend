using System;
using System.Collections.Generic;

namespace DataAccess.Data
{
    public partial class Property
    {
        public Property()
        {
            Contract = new HashSet<Contract>();
            Images = new HashSet<Images>();
        }

        public int PropertyId { get; set; }
        public int? IdIva { get; set; }
        public string Code { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Address { get; set; }
        public decimal PriceOwner { get; set; }
        public decimal? Percentage { get; set; }
        public decimal? FeeCompany { get; set; }
        public DateTime? RecruitmentDate { get; set; }
        public decimal FinalPrice { get; set; }
        public int? Rooms { get; set; }
        public int? Toilets { get; set; }
        public bool? Reception { get; set; }
        public bool? Pool { get; set; }
        public decimal? Area { get; set; }
        public string Observation { get; set; }
        public int PropertyStatusId { get; set; }
        public int CityId { get; set; }
        public int ZoneId { get; set; }
        public int OwnerId { get; set; }
        public int PropertyCategoryId { get; set; }
        public int TypeOfferId { get; set; }
        public int CompayId { get; set; }

        public City City { get; set; }
        public Company Compay { get; set; }
        public Iva IdIvaNavigation { get; set; }
        public Owner Owner { get; set; }
        public PropertyCategory PropertyCategory { get; set; }
        public PropertyStatus PropertyStatus { get; set; }
        public TypeOffer TypeOffer { get; set; }
        public Zone Zone { get; set; }
        public ICollection<Contract> Contract { get; set; }
        public ICollection<Images> Images { get; set; }
    }
}
