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
    /// Defines the <see cref="PropertyCategoryService" />.
    /// </summary>
    public class PropertyCategoryService : BaseService<PropertyCategoryDTO>
    {
        public PropertyCategoryService(IConfiguration config, string con) : base(new PropertyCategoryModel(config, con))
        {

        }

    }
}

