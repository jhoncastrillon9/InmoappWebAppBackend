namespace Business.Banks
{
    using Microsoft.Extensions.Configuration;
    using System;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    using CodeMono.Entities;
    using Entities.Banks;
    using DataAccess.Banks;
    using global::Commons.DTOs.Banks;

    /// <summary>
    /// Defines the <see cref="AccountsToReceivableContractService" />.
    /// </summary>
    public class AccountsToReceivableContractService : BaseService<AccountsToReceivableContractDTO>
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ZoneService"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>
        public AccountsToReceivableContractService(IConfiguration config, string con) : base(new AccountsToReceivableContractModel(config, con))
        {

        }

    }
}

