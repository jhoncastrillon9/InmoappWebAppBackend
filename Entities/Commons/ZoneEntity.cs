using System;

namespace Entities.Commons
{
    public class ZoneEntity
    {
		public Int32 ZoneId { get; set; }
		public String ZoneName { get; set; }
		public Int32 CityId { get; set; }
    }

    public class ZoneResponseSP : ResponseSP
    {
        public Int32 ZoneId { get; set; }      
    }

}
