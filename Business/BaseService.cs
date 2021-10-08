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
        protected BaseModel<TEntity> model;
        protected BaseStoreProcedureModel spModel;


        public BaseService(BaseModel<TEntity> model, BaseStoreProcedureModel spModel)
        {            
            this.model = model;
            this.spModel = spModel;
        }


        public async Task<ResponseModel> ExecStoreProcedure(Dictionary<string, dynamic> parameters, string spName)
        {
            response.data = await spModel.ExecStoreProcedure<TEntity>(parameters, spName);

            return response;
        }



    }
}
