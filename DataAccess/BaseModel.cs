using CodeMono.DataAccess.DBConnection;
using DataAccess.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class BaseModel<TEntity> where TEntity : class, new()
    {

        /// <summary>
        /// Contexto
        /// </summary>
        InmmoAppContext _context;

        public BaseModel(InmmoAppContext context)
        {           
            _context = context;
        }

        public async Task<IEnumerable<AccountsStatus>> PruebaTraerDatos()
        {
            
            var status = await _context.AccountsStatus.ToListAsync();
            return status;
        }
    }
}
