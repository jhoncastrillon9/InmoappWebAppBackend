namespace Business.Banks
{
    using Microsoft.Extensions.Configuration;
    using System;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    using CodeMono.Entities;
    using DataAccess.Banks;
    using global::Commons.DTOs.Banks;
    using DataAccess;
    using DataAccess.Data;

    /// <summary>
    /// Defines the <see cref="AccountsStatusService" />.
    /// </summary>
    public class AccountsStatusService : BaseService<AccountsStatus>
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ZoneService"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>
        public AccountsStatusService(AccountsStatusModel model, BaseStoreProcedureModel spModel) : base(model, spModel)
        {

        }

        public async void prueba()
        {
            var tt = await model.PruebaTraerDatos();
        }

    }
}

