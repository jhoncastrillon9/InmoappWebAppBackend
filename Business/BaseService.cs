using AutoMapper;
using Commons.DTOs;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace Business
{
    public class BaseService<TEntity> where TEntity : class, new()
    {
        protected ResponseMDTO response = new ResponseMDTO();
        protected BaseModel<TEntity> model;
        protected BaseStoreProcedureModel spModel;
        /// <summary>
        /// Automapper
        /// </summary>
        private readonly IMapper _mapper;


        public BaseService(BaseModel<TEntity> model, IMapper mapper, BaseStoreProcedureModel spModel = null)
        {
            this.model = model;
            this.spModel = spModel;
            _mapper = mapper;
        }

        public async Task<ResponseMDTO> ExecStoreProcedure<T>(Dictionary<string, dynamic> parameters, string spName)
        {
            response.data = await spModel.ExecStoreProcedure<T>(parameters, spName);

            return response;
        }

        /// <summary>
        /// Consulta todas las entidades
        /// </summary>
        public virtual IQueryable<TEntity> GetAll()
        {
            return model.GetAll;
        }

        /// <summary>
        /// Consulta una entidad por id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public virtual TEntity FindById(object id)
        {
            return model.FindById(id);
        }

        /// <summary>
        /// Realiza el insert sin guardar
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public virtual TEntity Insert(TEntity entity)
        {
            return model.Insert(entity);
        }

        /// <summary>
        /// inserta un rango de entidades sin guardar
        /// </summary>
        /// <param name="entities"></param>
        /// <returns></returns>
        public virtual IEnumerable<TEntity> InsertRange(IEnumerable<TEntity> entities)
        {
            return model.InsertRange(entities);
        }

        /// <summary>
        /// Crea un entidad (Guarda)
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public virtual TEntity Create(TEntity entity)
        {

            return model.Create(entity);
        }

        /// <summary>
        /// Crea varias entidades (Guarda)
        /// </summary>
        /// <param name="entities"></param>
        /// <returns></returns>
        public virtual IEnumerable<TEntity> CreateBatch(IEnumerable<TEntity> entities)
        {
            return model.CreateBatch(entities);
        }

        /// <summary>
        /// Actualiza la entidad (NO GUARDA)
        /// </summary>
        /// <param name="editedEntity">Entidad editada</param>
        /// <param name="originalEntity">Entidad Original sin cambios</param>
        /// <param name="changed">Indica si se modifico la entidad</param>
        /// <returns></returns>
        public virtual TEntity Modify(object id, TEntity editedEntity, out bool changed)
        {
            TEntity originalEntity = FindById(id);
            return model.Modify(editedEntity, originalEntity, out changed);
        }

        /// <summary>
        /// Actualiza la entidad (GUARDA)
        /// </summary>
        /// <param name="editedEntity">Entidad editada</param>
        /// <param name="originalEntity">Entidad Original sin cambios</param>
        /// <param name="changed">Indica si se modifico la entidad</param>
        /// <returns></returns>
        public virtual TEntity Update(object id, TEntity editedEntity, out bool changed)
        {
            TEntity originalEntity = FindById(id);
            return model.Modify(editedEntity, originalEntity, out changed);
        }

        /// <summary>
        /// Remueve una entidad (No guarda)
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public virtual TEntity Remove(TEntity entity)
        {
            return model.Remove(entity);
        }

        /// <summary>
        /// Remueve un rango de entidades (No guarda)
        /// </summary>
        /// <param name="entities"></param>
        /// <returns></returns>
        public virtual IEnumerable<TEntity> RemoveRange(IEnumerable<TEntity> entities)
        {
            return model.RemoveRange(entities);
        }

        /// <summary>
        /// Elimina una entidad (Guarda)
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public virtual TEntity Delete(TEntity entity)
        {
            return model.Delete(entity);
        }

        /// <summary>
        /// Elimina un rango de entidades  (Guarda)
        /// </summary>
        /// <param name="entities"></param>
        /// <returns></returns>
        public virtual IEnumerable<TEntity> DeleteBatch(IEnumerable<TEntity> entities)
        {
            return model.DeleteBatch(entities);
        }

        /// <summary>
        /// Consulta todas las entidades por una condición
        /// </summary>
        /// <param name="condition"></param>
        /// <returns></returns>
        public virtual IQueryable<TEntity> GetAllBy(Expression<Func<TEntity, bool>> condition)
        {
            return model.GetAllBy(condition);
        }

        /// <summary>
        /// Consulta una entidad por medio de una condición
        /// </summary>
        /// <param name="condition"></param>
        /// <returns></returns>

        public virtual TEntity GetBy(Expression<Func<TEntity, bool>> condition)
        {
            return model.GetBy(condition);
        }

        /// <summary>
        /// Guardar cambios
        /// </summary>
        public virtual void SaveChanges()
        {
            model.SaveChanges();
        }
    }
}
