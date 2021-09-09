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
    /// Defines the <see cref="TypeOfferService" />.
    /// </summary>
    public class TypeOfferService: BaseService<TypeOfferDTO>
    {
        public TypeOfferService(IConfiguration config, string con) : base(new TypeOfferModel(config, con))
        {

        }

    }
}

