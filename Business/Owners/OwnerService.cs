namespace Business.Owners
{
    using Microsoft.Extensions.Configuration;
    using System;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    using CodeMono.Entities;
    using Entities.Owners;
    using DataAccess.Owners;
    using global::Commons.DTOs.Owners;

    /// <summary>
    /// Defines the <see cref="OwnerService" />.
    /// </summary>
    public class OwnerService : BaseService<OwnerDTO>
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ZoneService"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>
        public OwnerService(IConfiguration config, string con) : base(new OwnerModel(config, con))
        {

        }

    }
}

