namespace CodeMono.DataAccess.DBConnection
{
    using Dapper;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Data;
    using System.Data.SqlClient;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="DBConnectionMSSQL" />.
    /// </summary>
    public class DBConnectionMSSQL : Disposable
    {
        /// <summary>
        /// Defines the _conexion.
        /// </summary>
        private readonly string _conexion;
        private readonly IConfiguration _configuration;

        /// <summary>
        /// Initializes a new instance of the <see cref="DBConnectionMSSQL"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public DBConnectionMSSQL(IConfiguration config)
        {
            _configuration = config;
            _conexion = _configuration.GetConnectionString("Development").ToString();
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="DBConnectionMSSQL"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="conexion">The conexion<see cref="string"/>.</param>
        public DBConnectionMSSQL(IConfiguration config, string conexion)
        {
            _conexion = config.GetConnectionString("Development").ToString();
        }

        /// <summary>
        /// The Query.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="P">The P<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <param name="SP">The SP<see cref="string"/>.</param>
        /// <returns>The <see cref="IEnumerable{T}"/>.</returns>
        public IEnumerable<T> Query<T>(Dictionary<string, dynamic> P, string SP)
        {
            using (IDbConnection con = new SqlConnection(_conexion))
            {
                DynamicParameters DP = new DynamicParameters();

                foreach (KeyValuePair<string, dynamic> item in P)
                {
                    DP.Add(item.Key, item.Value);
                }

                return con.Query<T>(SP, param: DP, commandType: CommandType.StoredProcedure);
            }
        }

        /// <summary>
        /// The QueryAsync.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="P">The P<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <param name="SP">The SP<see cref="string"/>.</param>
        /// <returns>The <see cref="Task{IEnumerable{T}}"/>.</returns>
        public async Task<IEnumerable<T>> QueryAsync<T>(Dictionary<string, dynamic> P, string SP)
        {
            using (IDbConnection con = new SqlConnection(_conexion))
            {
                DynamicParameters DP = new DynamicParameters();

                foreach (KeyValuePair<string, dynamic> item in P)
                {
                    DP.Add(item.Key, item.Value);
                }

                return await con.QueryAsync<T>(SP, param: DP, commandType: CommandType.StoredProcedure);
            }
        }

        /// <summary>
        /// The QuerySingle.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="P">The P<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <param name="SP">The SP<see cref="string"/>.</param>
        /// <returns>The <see cref="T"/>.</returns>
        public T QuerySingle<T>(Dictionary<string, dynamic> P, string SP)
        {
            using (IDbConnection conn = new SqlConnection(_conexion))
            {
                DynamicParameters DP = new DynamicParameters();

                foreach (KeyValuePair<string, dynamic> item in P)
                {
                    DP.Add(item.Key, item.Value);
                }
                return conn.QueryFirst<T>(SP, param: DP, commandType: CommandType.StoredProcedure);
            }
        }

        /// <summary>
        /// The QuerySingleAsync.
        /// </summary>
        /// <typeparam name="T">.</typeparam>
        /// <param name="P">The P<see cref="Dictionary{string, dynamic}"/>.</param>
        /// <param name="SP">The SP<see cref="string"/>.</param>
        /// <returns>The <see cref="Task{T}"/>.</returns>
        public async Task<T> QuerySingleAsync<T>(Dictionary<string, dynamic> P, string SP)
        {
            using (IDbConnection conn = new SqlConnection(_conexion))
            {
                DynamicParameters DP = new DynamicParameters();

                foreach (KeyValuePair<string, dynamic> item in P)
                {
                    DP.Add(item.Key, item.Value);
                }
                return await conn.QueryFirstAsync<T>(SP, param: DP, commandType: CommandType.StoredProcedure);
            }
        }
    }
}
