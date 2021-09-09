namespace DataAccess.Contracts
{
    using CodeMono.DataAccess.DBConnection;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="ContractDao" />.
    /// </summary>
    public class ContractDao: Disposable
    {
        /// <summary>
        /// Defines the database.
        /// </summary>
        internal DBConnectionMSSQL database;

        /// <summary>
        /// Initializes a new instance of the <see cref="ContractDao"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>
        public ContractDao(IConfiguration config, string con)
        {
            database = new DBConnectionMSSQL(config, con);
        }

        /// <summary>
        /// The GetContract.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{IEnumerable{T}}"/>.</returns>
        public async Task<IEnumerable<T>> GetContract<T>(Dictionary<string, dynamic> parameters)
        {
            return await database.QueryAsync<T>(parameters, "Contracts.Contract_READ");
        }
        
        /// <summary>
        /// The GetListContract.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{IEnumerable{T}}"/>.</returns>
        public async Task<IEnumerable<T>> GetListContract<T>(Dictionary<string, dynamic> parameters)
        {
            return await database.QueryAsync<T>(parameters, "Contracts.Contract_LIST");
        }

        /// <summary>
        /// The PostContract.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{T}"/>.</returns>
        public async Task<IEnumerable<T>> PostContract<T>(Dictionary<string, dynamic> parameters)
        {
            return await database.QueryAsync<T>(parameters, "Contracts.Contract_CREATE");
        }

        /// <summary>
        /// The PutContract.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{T}"/>.</returns>
        public async Task<IEnumerable<T>> PutContract<T>(Dictionary<string, dynamic> parameters)
        {
            return await database.QueryAsync<T>(parameters, "Contracts.Contract_UPDATE");
        }

        /// <summary>
        /// The EnableContract.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{T}"/>.</returns>
        public async Task<IEnumerable<T>> EnableContract<T>(Dictionary<string, dynamic> parameters)
        {
            return await database.QueryAsync<T>(parameters, "Contracts.Contract_ENABLE");
        }

        /// <summary>
        /// The DisableContract.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{T}"/>.</returns>
        public async Task<IEnumerable<T>> DisableContract<T>(Dictionary<string, dynamic> parameters)
        {
            return await database.QueryAsync<T>(parameters, "Contracts.Contract_DISABLE");
        }

        /// <summary>
        /// The DeleteContract.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{T}"/>.</returns>
        public async Task<IEnumerable<T>> DeleteContract<T>(Dictionary<string, dynamic> parameters)
        {
            return await database.QueryAsync<T>(parameters, "Contracts.Contract_DELETE");
        }

    }
}

