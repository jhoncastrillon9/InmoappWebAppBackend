using System;
using System.Collections.Generic;

namespace DataAccess.Data
{
    public partial class AccountsStatus
    {
        public AccountsStatus()
        {
            AccountsToPayContract = new HashSet<AccountsToPayContract>();
            AccountsToReceivableContract = new HashSet<AccountsToReceivableContract>();
        }

        public int AccountsStatusId { get; set; }
        public string AccountsStatusName { get; set; }

        public ICollection<AccountsToPayContract> AccountsToPayContract { get; set; }
        public ICollection<AccountsToReceivableContract> AccountsToReceivableContract { get; set; }
    }
}
