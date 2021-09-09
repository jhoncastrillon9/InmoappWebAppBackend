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
    /// Defines the <see cref="PropertyService" />.
    /// </summary>
    public class PropertyService : BaseService<PropertyDTO>
    {
        public PropertyService(IConfiguration config, string con) : base(new PropertyModel(config, con))
        {

        }
    }
}

