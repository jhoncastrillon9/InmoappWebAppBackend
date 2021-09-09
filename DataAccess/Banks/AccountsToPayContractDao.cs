namespace DataAccess.Banks
{
    using CodeMono.DataAccess.DBConnection;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="AccountsToPayContractDao" />.
    /// </summary>
    public class AccountsToPayContractDao: Disposable
    {
        /// <summary>
        /// Defines the database.
        /// </summary>
        internal DBConnectionMSSQL database;

        /// <summary>
        /// Initializes a new instance of the <see cref="AccountsToPayContractDao"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>
        public AccountsToPayContractDao(IConfiguration config, string con)
        {
            database = new DBConnectionMSSQL(config, con);
        }

        /// <summary>
        /// The GetAccountsToPayContract.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{IEnumerable{T}}"/>.</returns>
        public async Task<IEnumerable<T>> GetAccountsToPayContract<T>(Dictionary<string, dynamic> parameters)
        {
            return await database.QueryAsync<T>(parameters, "Banks.AccountsToPayContract_READ");
        }
        
        /// <summary>
        /// The GetListAccountsToPayContract.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{IEnumerable{T}}"/>.</returns>
        public async Task<IEnumerable<T>> GetListAccountsToPayContract<T>(Dictionary<string, dynamic> parameters)
        {
            return await database.QueryAsync<T>(parameters, "Banks.AccountsToPayContract_LIST");
        }

        /// <summary>
        /// The PostAccountsToPayContract.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{T}"/>.</returns>
        public async Task<IEnumerable<T>> PostAccountsToPayContract<T>(Dictionary<string, dynamic> parameters)
        {
            return await database.QueryAsync<T>(parameters, "Banks.AccountsToPayContract_CREATE");
        }

        /// <summary>
        /// The PutAccountsToPayContract.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{T}"/>.</returns>
        public async Task<IEnumerable<T>> PutAccountsToPayContract<T>(Dictionary<string, dynamic> parameters)
        {
            return await database.QueryAsync<T>(parameters, "Banks.AccountsToPayContract_UPDATE");
        }

        /// <summary>
        /// The EnableAccountsToPayContract.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{T}"/>.</returns>
        public async Task<IEnumerable<T>> EnableAccountsToPayContract<T>(Dictionary<string, dynamic> parameters)
        {
            return await database.QueryAsync<T>(parameters, "Banks.AccountsToPayContract_ENABLE");
        }

        /// <summary>
        /// The DisableAccountsToPayContract.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{T}"/>.</returns>
        public async Task<IEnumerable<T>> DisableAccountsToPayContract<T>(Dictionary<string, dynamic> parameters)
        {
            return await database.QueryAsync<T>(parameters, "Banks.AccountsToPayContract_DISABLE");
        }

        /// <summary>
        /// The DeleteAccountsToPayContract.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{T}"/>.</returns>
        public async Task<IEnumerable<T>> DeleteAccountsToPayContract<T>(Dictionary<string, dynamic> parameters)
        {
            return await database.QueryAsync<T>(parameters, "Banks.AccountsToPayContract_DELETE");
        }

    }
}

