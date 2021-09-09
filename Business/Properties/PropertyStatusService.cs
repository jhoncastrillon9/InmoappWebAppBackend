namespace Business.Properties
{
    using Microsoft.Extensions.Configuration;
    using System;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    using CodeMono.Entities;
    using Entities.Properties;
    using DataAccess.Properties;
    
    /// <summary>
    /// Defines the <see cref="PropertyStatusService" />.
    /// </summary>
    public class PropertyStatusService
    {
        /// <summary>
        /// Defines the dao.
        /// </summary>
        private readonly PropertyStatusDao dao;

        /// <summary>
        /// Defines the m.
        /// </summary>
        private ResponseModel m;

        /// <summary>
        /// Initializes a new instance of the <see cref="PropertyStatusService"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>
        public PropertyStatusService(IConfiguration config, string con)
        {
            dao = new PropertyStatusDao(config, con);
            m = new ResponseModel();
        }

        /// <summary>
        /// The GetPropertyStatus.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseModel> GetPropertyStatus(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.GetPropertyStatus<PropertyStatusModel>(parameters);
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
        /// The GetListPropertyStatus.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseModel> GetListPropertyStatus(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.GetListPropertyStatus<PropertyStatusListModel>(parameters);
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
        /// The PostPropertyStatus.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseModel> PostPropertyStatus(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.PostPropertyStatus<PropertyStatusPostModel>(parameters);
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
        /// The PutPropertyStatus.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseModel> PutPropertyStatus(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.PutPropertyStatus<PropertyStatusPutModel>(parameters);
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
        /// The EnablePropertyStatus.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseModel> EnablePropertyStatus(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.EnablePropertyStatus<PropertyStatusPutModel>(parameters);
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
        /// The DisablePropertyStatus.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseModel> DisablePropertyStatus(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.DisablePropertyStatus<PropertyStatusPutModel>(parameters);
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
        /// The DeletePropertyStatus.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseModel> DeletePropertyStatus(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.DeletePropertyStatus<PropertyStatusDeleteModel>(parameters);
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

