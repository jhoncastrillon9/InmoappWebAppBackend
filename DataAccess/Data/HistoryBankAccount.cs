using System;
using System.Collections.Generic;

namespace DataAccess.Data
{
    public partial class HistoryBankAccount
    {
        public int HistoryBankAccountId { get; set; }
        public int PaymentTypeId { get; set; }
        public decimal Value { get; set; }
        public int BankAccountId { get; set; }
        public int? AccountsToPayContractsId { get; set; }
        public int? AccountsToReceivableContractsId { get; set; }
        public string Obervation { get; set; }
        public int CompayId { get; set; }

        public AccountsToPayContract AccountsToPayContracts { get; set; }
        public AccountsToReceivableContract AccountsToReceivableContracts { get; set; }
        public BankAccount BankAccount { get; set; }
        public Company Compay { get; set; }
        public PaymentType PaymentType { get; set; }
    }
}
