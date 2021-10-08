namespace DataAccess.Properties
{
    using CodeMono.DataAccess.DBConnection;
    using DataAccess.Data;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="TypeOfferModel" />.
    /// </summary>
    public class TypeOfferModel: BaseModel<TypeOffer>
    {
        public TypeOfferModel(InmmoAppContext context) : base(context)
        {

        }

    }
}

