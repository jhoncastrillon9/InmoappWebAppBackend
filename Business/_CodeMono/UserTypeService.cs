
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
    /// Defines the <see cref="UserTypeService" />.
    /// </summary>
    public class UserTypeService
    {
        /// <summary>
        /// Defines the dao.
        /// </summary>
        private readonly UserTypeDao dao;

        /// <summary>
        /// Defines the m.
        /// </summary>
        private ResponseMDTO m;

        /// <summary>
        /// Initializes a new instance of the <see cref="UserTypeService"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>
        public UserTypeService(IConfiguration config)
        {
            dao = new UserTypeDao(config);
            m = new ResponseMDTO();
        }

        /// <summary>
        /// The GetUserType.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseMDTO> GetUserType(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.GetUserType<UserTypeDTO>(parameters);
                m.data = res;
                m.executionError = false;
                m.message = "";
            }
            catch (Exception ex)
            {
                m.data = null;
                m.executionError = true;
                m.message = "Error: " + ex.Message + ". " + ex.InnerException;
            }
            return m;
        }

        /// <summary>
        /// The GetListUserType.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseMDTO> GetListUserType(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.GetListUserType<UserTypeDTO>(parameters);
                m.data = res;
                m.executionError = false;
                m.message = "";
            }
            catch (Exception ex)
            {
                m.data = null;
                m.executionError = true;
                m.message = "Error: " + ex.Message + ". " + ex.InnerException;
            }
            return m;
        }

        /// <summary>
        /// The PostUserType.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseMDTO> PostUserType(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.PostUserType<UserTypeDTO>(parameters);
                m.data = res;
                m.executionError = false;
                m.message = "";
            }
            catch (Exception ex)
            {
                m.data = null;
                m.executionError = true;
                m.message = "Error: " + ex.Message + ". " + ex.InnerException;
            }

            return m;
        }

        /// <summary>
        /// The PutUserType.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseMDTO> PutUserType(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.PutUserType<UserTypeDTO>(parameters);
                m.data = res;
                m.executionError = false;
                m.message = "";
            }
            catch (Exception ex)
            {
                m.data = null;
                m.executionError = true;
                m.message = "Error: " + ex.Message + ". " + ex.InnerException;
            }

            return m;
        }

        /// <summary>
        /// The EnableUserType.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseMDTO> EnableUserType(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.EnableUserType<UserTypeDTO>(parameters);
                m.data = res;
                m.executionError = false;
                m.message = "";
            }
            catch (Exception ex)
            {
                m.data = null;
                m.executionError = true;
                m.message = "Error: " + ex.Message + ". " + ex.InnerException;
            }
            return m;
        }

        /// <summary>
        /// The DisableUserType.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseMDTO> DisableUserType(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.DisableUserType<UserTypeDTO>(parameters);
                m.data = res;
                m.executionError = false;
                m.message = "";
            }
            catch (Exception ex)
            {
                m.data = null;
                m.executionError = true;
                m.message = "Error: " + ex.Message + ". " + ex.InnerException;
            }
            return m;
        }

        /// <summary>
        /// The DeleteUserType.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseMDTO> DeleteUserType(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.DeleteUserType<UserTypeDTO>(parameters);
                m.data = res;
                m.executionError = false;
                m.message = "";
            }
            catch (Exception ex)
            {
                m.data = null;
                m.executionError = true;
                m.message = "Error: " + ex.Message + ". " + ex.InnerException;
            }
            return m;
        }

    }
}

