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
    /// Defines the <see cref="IvaService" />.
    /// </summary>
    public class IvaService
    {
        /// <summary>
        /// Defines the dao.
        /// </summary>
        private readonly IvaDao dao;

        /// <summary>
        /// Defines the m.
        /// </summary>
        private ResponseModel m;

        /// <summary>
        /// Initializes a new instance of the <see cref="IvaService"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>
        public IvaService(IConfiguration config, string con)
        {
            dao = new IvaDao(config, con);
            m = new ResponseModel();
        }

        /// <summary>
        /// The GetIva.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseModel> GetIva(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.GetIva<IvaModel>(parameters);
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
        /// The GetListIva.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseModel> GetListIva(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.GetListIva<IvaListModel>(parameters);
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
        /// The PostIva.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseModel> PostIva(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.PostIva<IvaPostModel>(parameters);
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
        /// The PutIva.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseModel> PutIva(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.PutIva<IvaPutModel>(parameters);
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
        /// The EnableIva.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseModel> EnableIva(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.EnableIva<IvaPutModel>(parameters);
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
        /// The DisableIva.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseModel> DisableIva(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.DisableIva<IvaPutModel>(parameters);
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
        /// The DeleteIva.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseModel> DeleteIva(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.DeleteIva<IvaDeleteModel>(parameters);
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

