using CodeMono.Entities;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Business
{
    public class BaseService<TEntity> where TEntity : class, new()
    {          
        protected ResponseModel response = new ResponseModel();
        protected BaseModel model;

        public BaseService(BaseModel model)
        {            
            this.model = model;
        }


        public async Task<ResponseModel> ExecStoreProcedure(Dictionary<string, dynamic> parameters, string spName)
        {
            response.data = await model.ExecStoreProcedure<TEntity>(parameters, spName);

            return response;
        }



    }
}
