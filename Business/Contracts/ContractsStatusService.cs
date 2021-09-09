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
    /// Defines the <see cref="ContractsStatusService" />.
    /// </summary>
    public class ContractsStatusService : BaseService<ContractsStatusDTO>
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ZoneService"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>
        public ContractsStatusService(IConfiguration config, string con) : base(new ContractsStatusModel(config, con))
        {

        }

    }
}

