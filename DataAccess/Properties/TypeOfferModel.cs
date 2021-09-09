namespace DataAccess.Properties
{
    using CodeMono.DataAccess.DBConnection;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="TypeOfferModel" />.
    /// </summary>
    public class TypeOfferModel: BaseModel
    {
        public TypeOfferModel(IConfiguration config, string con) : base(config, con)
        {

        }

    }
}

