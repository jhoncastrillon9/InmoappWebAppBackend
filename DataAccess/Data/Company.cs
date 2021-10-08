using System;
using System.Collections.Generic;

namespace DataAccess.Data
{
    public partial class Company
    {
        public Company()
        {
            AccountsToPayContract = new HashSet<AccountsToPayContract>();
            AccountsToReceivableContract = new HashSet<AccountsToReceivableContract>();
            BankAccount = new HashSet<BankAccount>();
            Contract = new HashSet<Contract>();
            HistoryBankAccount = new HashSet<HistoryBankAccount>();
            Owner = new HashSet<Owner>();
            PaymentType = new HashSet<PaymentType>();
            Property = new HashSet<Property>();
            Tenant = new HashSet<Tenant>();
        }

        public int CompayId { get; set; }
        public string CompanyName { get; set; }
        public string Document { get; set; }
        public string Telephone { get; set; }
        public string Mobile { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string Observation { get; set; }

        public ICollection<AccountsToPayContract> AccountsToPayContract { get; set; }
        public ICollection<AccountsToReceivableContract> AccountsToReceivableContract { get; set; }
        public ICollection<BankAccount> BankAccount { get; set; }
        public ICollection<Contract> Contract { get; set; }
        public ICollection<HistoryBankAccount> HistoryBankAccount { get; set; }
        public ICollection<Owner> Owner { get; set; }
        public ICollection<PaymentType> PaymentType { get; set; }
        public ICollection<Property> Property { get; set; }
        public ICollection<Tenant> Tenant { get; set; }
    }
}
