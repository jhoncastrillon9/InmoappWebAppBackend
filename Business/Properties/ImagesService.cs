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
    /// Defines the <see cref="ImagesService" />.
    /// </summary>
    public class ImagesService : BaseService<ImagesDTO>
    {
        public ImagesService(IConfiguration config, string con) : base(new ImagesModel(config, con))
        {

        }

    }
}

