namespace Business.Tenants
{
    using Microsoft.Extensions.Configuration;
    using System;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    using CodeMono.Entities;
    using Entities.Tenants;
    using DataAccess.Tenants;
    using global::Commons.DTOs.Tenants;

    /// <summary>
    /// Defines the <see cref="TenantService" />.
    /// </summary>
    public class TenantService : BaseService<TenantDTO>
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ZoneService"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>
        public TenantService(IConfiguration config, string con) : base(new TenantModel(config, con))
        {

        }

    }
}

