namespace DataAccess.Owners
{
    using CodeMono.DataAccess.DBConnection;
    using DataAccess.Data;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="OwnerModel" />.
    /// </summary>
    public class OwnerModel: BaseModel<Owner>
    {
        public OwnerModel(InmmoAppContext context) : base(context)
        {

        }
    }
}

