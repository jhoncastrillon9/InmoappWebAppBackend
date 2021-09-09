namespace Business.Banks
{
    using Microsoft.Extensions.Configuration;
    using System;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    using CodeMono.Entities;
    using Entities.Banks;
    using DataAccess.Banks;
    
    /// <summary>
    /// Defines the <see cref="PaymentTypeService" />.
    /// </summary>
    public class PaymentTypeService
    {
        /// <summary>
        /// Defines the dao.
        /// </summary>
        private readonly PaymentTypeDao dao;

        /// <summary>
        /// Defines the m.
        /// </summary>
        private ResponseModel response;

        /// <summary>
        /// Initializes a new instance of the <see cref="PaymentTypeService"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>
        public PaymentTypeService(IConfiguration config, string con)
        {
            dao = new PaymentTypeDao(config, con);
            response = new ResponseModel();
        }

        /// <summary>
        /// The GetPaymentType.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseModel> GetPaymentType(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var data = await dao.GetPaymentType<PaymentTypeModel>(parameters);
                response.data = data;
                response.executionError = false;
                response.message = "";
            }
            catch (Exception ex)
            {
                response.data = null;
                response.executionError = true;
                response.message = "Error: " + ex.Message + ". " + ex.InnerException;
            }
            return response;
        }

        /// <summary>
        /// The GetListPaymentType.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseModel> GetListPaymentType(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.GetListPaymentType<PaymentTypeListModel>(parameters);
                response.data = res;
                response.executionError = false;
                response.message = "";
            }
            catch (Exception ex)
            {
                response.data = null;
                response.executionError = true;
                response.message = "Error: " + ex.Message + ". " + ex.InnerException;
            }
            return response;
        }

        /// <summary>
        /// The PostPaymentType.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseModel> PostPaymentType(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.PostPaymentType<PaymentTypePostModel>(parameters);
                response.data = res;
                response.executionError = false;
                response.message = "";
            }
            catch (Exception ex)
            {
                response.data = null;
                response.executionError = true;
                response.message = "Error: " + ex.Message + ". " + ex.InnerException;
            }

            return response;
        }

        /// <summary>
        /// The PutPaymentType.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseModel> PutPaymentType(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.PutPaymentType<PaymentTypePutModel>(parameters);
                response.data = res;
                response.executionError = false;
                response.message = "";
            }
            catch (Exception ex)
            {
                response.data = null;
                response.executionError = true;
                response.message = "Error: " + ex.Message + ". " + ex.InnerException;
            }

            return response;
        }

        /// <summary>
        /// The EnablePaymentType.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseModel> EnablePaymentType(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.EnablePaymentType<PaymentTypePutModel>(parameters);
                response.data = res;
                response.executionError = false;
                response.message = "";
            }
            catch (Exception ex)
            {
                response.data = null;
                response.executionError = true;
                response.message = "Error: " + ex.Message + ". " + ex.InnerException;
            }
            return response;
        }

        /// <summary>
        /// The DisablePaymentType.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseModel> DisablePaymentType(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.DisablePaymentType<PaymentTypePutModel>(parameters);
                response.data = res;
                response.executionError = false;
                response.message = "";
            }
            catch (Exception ex)
            {
                response.data = null;
                response.executionError = true;
                response.message = "Error: " + ex.Message + ". " + ex.InnerException;
            }
            return response;
        }

        /// <summary>
        /// The DeletePaymentType.
        /// </summary>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{ResponseModel}"/>.</returns>
        public async Task<ResponseModel> DeletePaymentType(Dictionary<string, dynamic> parameters)
        {
            try
            {
                var res = await dao.DeletePaymentType<PaymentTypeDeleteModel>(parameters);
                response.data = res;
                response.executionError = false;
                response.message = "";
            }
            catch (Exception ex)
            {
                response.data = null;
                response.executionError = true;
                response.message = "Error: " + ex.Message + ". " + ex.InnerException;
            }
            return response;
        }

    }
}

