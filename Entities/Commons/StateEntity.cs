using System;

namespace Entities.Commons
{
    public class StateEntity
    {
		public Int32 StateId { get; set; }
		public String StateName { get; set; }
    }

    public class StateResponseSP:ResponseSP
    {
		public Int32 StateId { get; set; }
    }
}
