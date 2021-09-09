namespace DataAccess.Banks
{
    using CodeMono.DataAccess.DBConnection;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="HistoryBankAccountDao" />.
    /// </summary>
    public class HistoryBankAccountDao: Disposable
    {
        /// <summary>
        /// Defines the database.
        /// </summary>
        internal DBConnectionMSSQL database;

        /// <summary>
        /// Initializes a new instance of the <see cref="HistoryBankAccountDao"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>
        public HistoryBankAccountDao(IConfiguration config, string con)
        {
            database = new DBConnectionMSSQL(config, con);
        }

        /// <summary>
        /// The GetHistoryBankAccount.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{IEnumerable{T}}"/>.</returns>
        public async Task<IEnumerable<T>> GetHistoryBankAccount<T>(Dictionary<string, dynamic> parameters)
        {
            return await database.QueryAsync<T>(parameters, "Banks.HistoryBankAccount_READ");
        }
        
        /// <summary>
        /// The GetListHistoryBankAccount.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{IEnumerable{T}}"/>.</returns>
        public async Task<IEnumerable<T>> GetListHistoryBankAccount<T>(Dictionary<string, dynamic> parameters)
        {
            return await database.QueryAsync<T>(parameters, "Banks.HistoryBankAccount_LIST");
        }

        /// <summary>
        /// The PostHistoryBankAccount.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{T}"/>.</returns>
        public async Task<IEnumerable<T>> PostHistoryBankAccount<T>(Dictionary<string, dynamic> parameters)
        {
            return await database.QueryAsync<T>(parameters, "Banks.HistoryBankAccount_CREATE");
        }

        /// <summary>
        /// The PutHistoryBankAccount.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{T}"/>.</returns>
        public async Task<IEnumerable<T>> PutHistoryBankAccount<T>(Dictionary<string, dynamic> parameters)
        {
            return await database.QueryAsync<T>(parameters, "Banks.HistoryBankAccount_UPDATE");
        }

        /// <summary>
        /// The EnableHistoryBankAccount.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{T}"/>.</returns>
        public async Task<IEnumerable<T>> EnableHistoryBankAccount<T>(Dictionary<string, dynamic> parameters)
        {
            return await database.QueryAsync<T>(parameters, "Banks.HistoryBankAccount_ENABLE");
        }

        /// <summary>
        /// The DisableHistoryBankAccount.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{T}"/>.</returns>
        public async Task<IEnumerable<T>> DisableHistoryBankAccount<T>(Dictionary<string, dynamic> parameters)
        {
            return await database.QueryAsync<T>(parameters, "Banks.HistoryBankAccount_DISABLE");
        }

        /// <summary>
        /// The DeleteHistoryBankAccount.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{T}"/>.</returns>
        public async Task<IEnumerable<T>> DeleteHistoryBankAccount<T>(Dictionary<string, dynamic> parameters)
        {
            return await database.QueryAsync<T>(parameters, "Banks.HistoryBankAccount_DELETE");
        }

    }
}

