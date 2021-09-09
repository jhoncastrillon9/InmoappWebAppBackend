namespace Business.Commons
{
    using Microsoft.Extensions.Configuration;
    using System;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    using CodeMono.Entities;
    using Entities.Commons;
    using DataAccess.Commons;
    
    /// <summary>
    /// Defines the <see cref="StateService" />.
    /// </summary>
    public class StateService: BaseService<StateResponseSP>
    {
        public StateService(IConfiguration config, string con) : base(new ZoneModel(config, con))
        {

        }
    }
}

