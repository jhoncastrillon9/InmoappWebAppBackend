using System;
using System.Collections.Generic;

namespace DataAccess.Data
{
    public partial class AccountsToPayContract
    {
        public AccountsToPayContract()
        {
            HistoryBankAccount = new HashSet<HistoryBankAccount>();
        }

        public int AccountsToPayContractId { get; set; }
        public int QuotaNumber { get; set; }
        public decimal Value { get; set; }
        public DateTime ExpirationDate { get; set; }
        public int? AccountsStatusId { get; set; }
        public int ContractId { get; set; }
        public int CompayId { get; set; }

        public AccountsStatus AccountsStatus { get; set; }
        public Company Compay { get; set; }
        public Contract Contract { get; set; }
        public ICollection<HistoryBankAccount> HistoryBankAccount { get; set; }
    }
}
