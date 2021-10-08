namespace DataAccess.Properties
{
    using CodeMono.DataAccess.DBConnection;
    using DataAccess.Data;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="IvaModel" />.
    /// </summary>
    public class IvaModel: BaseModel<Iva>
    {
        public IvaModel(InmmoAppContext context) : base(context)
        {

        }
    }
}

