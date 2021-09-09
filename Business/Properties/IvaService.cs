namespace Business.Properties
{
    using Microsoft.Extensions.Configuration;
    using System;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    using CodeMono.Entities;
    using Entities.Properties;
    using DataAccess.Properties;
    using global::Commons.DTOs.Properties;

    /// <summary>
    /// Defines the <see cref="IvaService" />.
    /// </summary>
    public class IvaService : BaseService<IvaDTO>
    {
        public IvaService(IConfiguration config, string con) : base(new IvaModel(config, con))
        {

        }

    }
}

