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
    /// Defines the <see cref="BankAccountService" />.
    /// </summary>
    public class BankAccountService : BaseService<BankAccount>
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ZoneService"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>
        public BankAccountService(BankAccountModel model, BaseStoreProcedureModel spModel) : base(model, spModel)       
        {

        }

    }
}

