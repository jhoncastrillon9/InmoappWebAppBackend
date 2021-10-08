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
    using DataAccess;
    using DataAccess.Data;

    /// <summary>
    /// Defines the <see cref="TypeOfferService" />.
    /// </summary>
    public class TypeOfferService: BaseService<TypeOffer>
    {        
        public TypeOfferService(TypeOfferModel model, BaseStoreProcedureModel spModel) : base(model, spModel)
        {

        }

    }
}

