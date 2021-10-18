using CodeMono.DataAccess;
using Commons.DTOs;
using Commons.DTOs.Users;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace CodeMono.Business
{

    /// <summary>
    /// Defines the <see cref="AuthenticationService" />.
    /// </summary>
    public class AuthenticationService
    {
        /// <summary>
        /// Defines the dao.
        /// </summary>
        private readonly AuthenticationDao dao;

        /// <summary>
        /// Defines the m.
        /// </summary>
        private ResponseMDTO m;

        /// <summary>
        /// Initializes a new instance of the <see cref="AuthenticationService"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>
        public AuthenticationService(IConfiguration config)
        {
            dao = new AuthenticationDao(config);
            m = new ResponseMDTO();
        }

        /// <summary>
        /// The Validate.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseMDTO> Validate(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.Validate<AuthenticationResponseDTO>(parameters);
                m.data = res;
                m.executionError = false;
                m.message = "";
            }
            catch (Exception ex)
            {
                m.data = null;
                m.executionError = true;
                m.message = ex.Message;
            }
            return m;
        }
    }
}
