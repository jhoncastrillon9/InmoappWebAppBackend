namespace Business.Contracts
{
    using Microsoft.Extensions.Configuration;
    using System;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    using CodeMono.Entities;
    using Entities.Contracts;
    using DataAccess.Contracts;
    using global::Commons.DTOs.Contracts;

    /// <summary>
    /// Defines the <see cref="ContractService" />.
    /// </summary>
    public class ContractService : BaseService<ContractDTO>
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ZoneService"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>
        public ContractService(IConfiguration config, string con) : base(new ContractModel(config, con))
        {

        }

    }
}

