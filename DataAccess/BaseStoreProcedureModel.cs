﻿using CodeMono.DataAccess.DBConnection;
using DataAccess.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class BaseStoreProcedureModel : Disposable 
    {

        /// <summary>
        /// Defines the database.
        /// </summary>
        internal DBConnectionMSSQL database;

        public BaseStoreProcedureModel(DBConnectionMSSQL db)
        {
            database = db;          
        }

        /// <summary>
        /// ejecuta un SP de la BD
        /// </summary>
        /// <typeparam name="T">Tipo de entidad</typeparam>
        /// <param name="parameters">Dicinario de datos</param>
        /// <param name="spName">Procedimiento almacenado</param>
        /// <returns>Respuesta del SP</returns>
        public async Task<IEnumerable<T>> ExecStoreProcedure<T>(Dictionary<string, dynamic> parameters, string spName)
        {
           return await database.QueryAsync<T>(parameters, spName);
        }
    }
}