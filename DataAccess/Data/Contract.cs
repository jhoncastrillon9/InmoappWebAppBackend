using System;
using System.Collections.Generic;

namespace DataAccess.Data
{
    public partial class Contract
    {
        public Contract()
        {
            AccountsToPayContract = new HashSet<AccountsToPayContract>();
            AccountsToReceivableContract = new HashSet<AccountsToReceivableContract>();
        }

        public int ContractId { get; set; }
        public DateTime ContractDate { get; set; }
        public DateTime InnitialDate { get; set; }
        public int QuantityMonths { get; set; }
        public decimal RentalFeeForOwner { get; set; }
        public decimal RentalFeeForTennat { get; set; }
        public string Observation { get; set; }
        public int? StatusId { get; set; }
        public int PropertyId { get; set; }
        public int TenantId { get; set; }
        public int CompayId { get; set; }

        public Company Compay { get; set; }
        public Property Property { get; set; }
        public ContractsStatus Status { get; set; }
        public Tenant Tenant { get; set; }
        public ICollection<AccountsToPayContract> AccountsToPayContract { get; set; }
        public ICollection<AccountsToReceivableContract> AccountsToReceivableContract { get; set; }
    }
}
