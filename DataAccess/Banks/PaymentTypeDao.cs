namespace DataAccess.Banks
{
    using CodeMono.DataAccess.DBConnection;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="PaymentTypeDao" />.
    /// </summary>
    public class PaymentTypeDao: Disposable
    {
        /// <summary>
        /// Defines the database.
        /// </summary>
        internal DBConnectionMSSQL database;

        /// <summary>
        /// Initializes a new instance of the <see cref="PaymentTypeDao"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>
        public PaymentTypeDao(IConfiguration config, string con)
        {
            database = new DBConnectionMSSQL(config, con);
        }

        /// <summary>
        /// The GetPaymentType.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{IEnumerable{T}}"/>.</returns>
        public async Task<IEnumerable<T>> GetPaymentType<T>(Dictionary<string, dynamic> parameters)
        {
            return await database.QueryAsync<T>(parameters, "Banks.PaymentType_READ");
        }
        
        /// <summary>
        /// The GetListPaymentType.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{IEnumerable{T}}"/>.</returns>
        public async Task<IEnumerable<T>> GetListPaymentType<T>(Dictionary<string, dynamic> parameters)
        {
            return await database.QueryAsync<T>(parameters, "Banks.PaymentType_LIST");
        }

        /// <summary>
        /// The PostPaymentType.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{T}"/>.</returns>
        public async Task<IEnumerable<T>> PostPaymentType<T>(Dictionary<string, dynamic> parameters)
        {
            return await database.QueryAsync<T>(parameters, "Banks.PaymentType_CREATE");
        }

        /// <summary>
        /// The PutPaymentType.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{T}"/>.</returns>
        public async Task<IEnumerable<T>> PutPaymentType<T>(Dictionary<string, dynamic> parameters)
        {
            return await database.QueryAsync<T>(parameters, "Banks.PaymentType_UPDATE");
        }

        /// <summary>
        /// The EnablePaymentType.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{T}"/>.</returns>
        public async Task<IEnumerable<T>> EnablePaymentType<T>(Dictionary<string, dynamic> parameters)
        {
            return await database.QueryAsync<T>(parameters, "Banks.PaymentType_ENABLE");
        }

        /// <summary>
        /// The DisablePaymentType.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{T}"/>.</returns>
        public async Task<IEnumerable<T>> DisablePaymentType<T>(Dictionary<string, dynamic> parameters)
        {
            return await database.QueryAsync<T>(parameters, "Banks.PaymentType_DISABLE");
        }

        /// <summary>
        /// The DeletePaymentType.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{T}"/>.</returns>
        public async Task<IEnumerable<T>> DeletePaymentType<T>(Dictionary<string, dynamic> parameters)
        {
            return await database.QueryAsync<T>(parameters, "Banks.PaymentType_DELETE");
        }

    }
}

