namespace DataAccess.Tenants
{
    using CodeMono.DataAccess.DBConnection;
    using DataAccess.Data;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="TenantModel" />.
    /// </summary>
    public class TenantModel: BaseModel<Tenant>
    {
        public TenantModel(InmmoAppContext context) : base(context)
        {

        }

    }
}

