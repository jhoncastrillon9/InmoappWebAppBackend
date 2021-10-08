using System;
using System.Collections.Generic;

namespace DataAccess.Data
{
    public partial class PaymentType
    {
        public PaymentType()
        {
            HistoryBankAccount = new HashSet<HistoryBankAccount>();
        }

        public int PaymentTypeId { get; set; }
        public string PaymentTypeName { get; set; }
        public int CompayId { get; set; }

        public Company Compay { get; set; }
        public ICollection<HistoryBankAccount> HistoryBankAccount { get; set; }
    }
}
