namespace DataAccess.Properties
{
    using CodeMono.DataAccess.DBConnection;
    using DataAccess.Data;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="ImagesModel" />.
    /// </summary>
    public class ImagesModel : BaseModel<Images>
    {
        public ImagesModel(InmmoAppContext context) : base(context)
        {

        }
    }
}

