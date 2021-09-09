namespace Business.Companies
{
    using Microsoft.Extensions.Configuration;
    using System;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    using CodeMono.Entities;
    using Entities.Companies;
    using DataAccess.Companies;
    using global::Commons.DTOs.Companies;

    /// <summary>
    /// Defines the <see cref="CompanyService" />.
    /// </summary>
    public class CompanyService : BaseService<CompanyDTO>
    {
        public CompanyService(IConfiguration config, string con) : base(new CompanyModel(config, con))
        {

        }
    }
}

