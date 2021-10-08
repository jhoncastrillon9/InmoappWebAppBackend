using System;
using System.Collections.Generic;

namespace DataAccess.Data
{
    public partial class ContractsStatus
    {
        public ContractsStatus()
        {
            Contract = new HashSet<Contract>();
        }

        public int ContractsStatusId { get; set; }
        public string ContractsStatusName { get; set; }

        public ICollection<Contract> Contract { get; set; }
    }
}
