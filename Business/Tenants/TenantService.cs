namespace Business.Tenants
{
    using Microsoft.Extensions.Configuration;
    using System;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    using CodeMono.Entities;
    using Entities.Tenants;
    using DataAccess.Tenants;
    
    /// <summary>
    /// Defines the <see cref="TenantService" />.
    /// </summary>
    public class TenantService
    {
        /// <summary>
        /// Defines the dao.
        /// </summary>
        private readonly TenantDao dao;

        /// <summary>
        /// Defines the m.
        /// </summary>
        private ResponseModel m;

        /// <summary>
        /// Initializes a new instance of the <see cref="TenantService"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>
        public TenantService(IConfiguration config, string con)
        {
            dao = new TenantDao(config, con);
            m = new ResponseModel();
        }

        /// <summary>
        /// The GetTenant.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseModel> GetTenant(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.GetTenant<TenantModel>(parameters);
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
        /// The GetListTenant.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseModel> GetListTenant(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.GetListTenant<TenantListModel>(parameters);
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
        /// The PostTenant.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseModel> PostTenant(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.PostTenant<TenantPostModel>(parameters);
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
        /// The PutTenant.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseModel> PutTenant(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.PutTenant<TenantPutModel>(parameters);
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
        /// The EnableTenant.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseModel> EnableTenant(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.EnableTenant<TenantPutModel>(parameters);
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
        /// The DisableTenant.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseModel> DisableTenant(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.DisableTenant<TenantPutModel>(parameters);
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
        /// The DeleteTenant.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseModel> DeleteTenant(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.DeleteTenant<TenantDeleteModel>(parameters);
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

