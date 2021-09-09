namespace DataAccess.Properties
{
    using CodeMono.DataAccess.DBConnection;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="TypeOfferDao" />.
    /// </summary>
    public class TypeOfferDao: Disposable
    {
        /// <summary>
        /// Defines the database.
        /// </summary>
        internal DBConnectionMSSQL database;

        /// <summary>
        /// Initializes a new instance of the <see cref="TypeOfferDao"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="con">The con<see cref="string"/>.</param>
        public TypeOfferDao(IConfiguration config, string con)
        {
            database = new DBConnectionMSSQL(config, con);
        }

        /// <summary>
        /// The GetTypeOffer.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{IEnumerable{T}}"/>.</returns>
        public async Task<IEnumerable<T>> GetTypeOffer<T>(Dictionary<string, dynamic> parameters)
        {
            return await database.QueryAsync<T>(parameters, "Properties.TypeOffer_READ");
        }
        
        /// <summary>
        /// The GetListTypeOffer.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{IEnumerable{T}}"/>.</returns>
        public async Task<IEnumerable<T>> GetListTypeOffer<T>(Dictionary<string, dynamic> parameters)
        {
            return await database.QueryAsync<T>(parameters, "Properties.TypeOffer_LIST");
        }

        /// <summary>
        /// The PostTypeOffer.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{T}"/>.</returns>
        public async Task<IEnumerable<T>> PostTypeOffer<T>(Dictionary<string, dynamic> parameters)
        {
            return await database.QueryAsync<T>(parameters, "Properties.TypeOffer_CREATE");
        }

        /// <summary>
        /// The PutTypeOffer.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{T}"/>.</returns>
        public async Task<IEnumerable<T>> PutTypeOffer<T>(Dictionary<string, dynamic> parameters)
        {
            return await database.QueryAsync<T>(parameters, "Properties.TypeOffer_UPDATE");
        }

        /// <summary>
        /// The EnableTypeOffer.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{T}"/>.</returns>
        public async Task<IEnumerable<T>> EnableTypeOffer<T>(Dictionary<string, dynamic> parameters)
        {
            return await database.QueryAsync<T>(parameters, "Properties.TypeOffer_ENABLE");
        }

        /// <summary>
        /// The DisableTypeOffer.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{T}"/>.</returns>
        public async Task<IEnumerable<T>> DisableTypeOffer<T>(Dictionary<string, dynamic> parameters)
        {
            return await database.QueryAsync<T>(parameters, "Properties.TypeOffer_DISABLE");
        }

        /// <summary>
        /// The DeleteTypeOffer.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="parameters">The parameters<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <returns>The <see cref="Task{T}"/>.</returns>
        public async Task<IEnumerable<T>> DeleteTypeOffer<T>(Dictionary<string, dynamic> parameters)
        {
            return await database.QueryAsync<T>(parameters, "Properties.TypeOffer_DELETE");
        }

    }
}

