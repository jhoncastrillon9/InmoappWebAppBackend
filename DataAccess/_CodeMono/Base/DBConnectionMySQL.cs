namespace CodeMono.DataAccess.DBConnection
{
    using Dapper;
    using Microsoft.Extensions.Configuration;
    using MySql.Data.MySqlClient;
    using System.Collections.Generic;
    using System.Threading.Tasks;
    using System.Data;

    /// <summary>
    /// Defines the <see cref="DBConnectionMySQL" />.
    /// </summary>
    public class DBConnectionMySQL : Disposable
    {
        /// <summary>
        /// Defines the _conexion.
        /// </summary>
        private readonly string _conexion;

        /// <summary>
        /// Initializes a new instance of the <see cref="DBConnectionMySQL"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        public DBConnectionMySQL(IConfiguration config)
        {
            _conexion = config.GetConnectionString("Default").ToString();
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="DBConnectionMySQL"/> class.
        /// </summary>
        /// <param name="config">The config<see cref="IConfiguration"/>.</param>
        /// <param name="conexion">The conexion<see cref="string"/>.</param>
        public DBConnectionMySQL(IConfiguration config, string conexion)
        {
            _conexion = config.GetConnectionString(conexion).ToString();
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
            using (IDbConnection con = new MySqlConnection(_conexion))
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
            using (IDbConnection con = new MySqlConnection(_conexion))
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
            using (IDbConnection conn = new MySqlConnection(_conexion))
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
            using (IDbConnection conn = new MySqlConnection(_conexion))
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
