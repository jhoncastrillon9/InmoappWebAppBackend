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
    /// Defines the <see cref="PropertyCategoryService" />.
    /// </summary>
    public class PropertyCategoryService
    {
        /// <summary>
        /// Defines the dao.
        /// </summary>
        private readonly PropertyCategoryDao dao;

        /// <summary>
        /// Defines the m.
        /// </summary>
        private ResponseModel m;

        /// <summary>
        /// Initializes a new instance of the <see cref="PropertyCategoryService"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>
        public PropertyCategoryService(IConfiguration config, string con)
        {
            dao = new PropertyCategoryDao(config, con);
            m = new ResponseModel();
        }

        /// <summary>
        /// The GetPropertyCategory.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseModel> GetPropertyCategory(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.GetPropertyCategory<PropertyCategoryModel>(parameters);
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
        /// The GetListPropertyCategory.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseModel> GetListPropertyCategory(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.GetListPropertyCategory<PropertyCategoryListModel>(parameters);
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
        /// The PostPropertyCategory.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseModel> PostPropertyCategory(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.PostPropertyCategory<PropertyCategoryPostModel>(parameters);
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
        /// The PutPropertyCategory.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseModel> PutPropertyCategory(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.PutPropertyCategory<PropertyCategoryPutModel>(parameters);
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
        /// The EnablePropertyCategory.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseModel> EnablePropertyCategory(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.EnablePropertyCategory<PropertyCategoryPutModel>(parameters);
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
        /// The DisablePropertyCategory.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseModel> DisablePropertyCategory(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.DisablePropertyCategory<PropertyCategoryPutModel>(parameters);
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
        /// The DeletePropertyCategory.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseModel> DeletePropertyCategory(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.DeletePropertyCategory<PropertyCategoryDeleteModel>(parameters);
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

