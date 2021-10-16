using System.Collections.Generic;

namespace DataAccess.Data
{
    public partial class BankAccount
    {
        public BankAccount()
        {
            HistoryBankAccount = new HashSet<HistoryBankAccount>();
        }

        public int BankAccountId { get; set; }
        public string BankAccountName { get; set; }
        public decimal Total { get; set; }
        public int CompayId { get; set; }

        public Company Compay { get; set; }
        public ICollection<HistoryBankAccount> HistoryBankAccount { get; set; }
    }
}
