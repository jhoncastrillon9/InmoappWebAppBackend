using AutoMapper;
using Commons.DTOs;
using Commons.Resources;
using DataAccess;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Security.Claims;
using System.Threading.Tasks;

namespace Business
{
    public class BaseService<TEntity> where TEntity : class, new()
    {
        /// <summary>
        /// Contexto dela petición
        /// </summary>
        protected readonly IHttpContextAccessor _HttpContext;

        protected ResponseMDTO response = new ResponseMDTO();
        protected BaseModel<TEntity> _BaseModel;
        protected BaseStoreProcedureModel _SpModel;
        /// <summary>
        /// Claims del usuario
        /// </summary>
        protected ClaimsIdentity _ClaimsUser;
        /// <summary>
        /// Id del usuario actual
        /// </summary>
        private int currentUserId;
        /// <summary>
        /// Id de la compañia del usuario actual
        /// </summary>
        private int currentCompanyIdUser;
        /// <summary>
        /// Automapper
        /// </summary>
        private readonly IMapper _mapper;


        public BaseService(BaseModel<TEntity> baseModel, IMapper mapper, IHttpContextAccessor httpContext, BaseStoreProcedureModel spModel = null)
        {
            _BaseModel = baseModel;
            _SpModel = spModel;
            _mapper = mapper;
            //Se acarga contexto e información del usuario
            _HttpContext = httpContext;
            ///Dto generico que se envia al controlador
            response.Message = Messages.SuccessGeneral;
            response.ExecutionError = false;
        }

        #region Genericos

        public void ValidateCompany(int companyId)
        {
            LoadClaims();

            if (companyId != currentCompanyIdUser)
            {
                throw new Exception(Messages.ErrorEntityNoAutorizate);
            }

        }

        /// <summary>
        /// Carga los claims del usuario
        /// </summary>
        private void LoadClaims()
        {
            ///Solamente los carga cuando nunca los ha cargado
            if (_ClaimsUser==null)
            {
                _ClaimsUser = _HttpContext.HttpContext.User.Identity as ClaimsIdentity;
                currentUserId = int.Parse(_ClaimsUser.FindFirst("userId").Value);
                currentCompanyIdUser = int.Parse(_ClaimsUser.FindFirst("companyId").Value);

            }            
        }

        public void ValidateUserId(int companyId)
        {
            LoadClaims();
            if (companyId != currentUserId)
            {
                throw new Exception(Messages.ErrorEntityNoAutorizate);
            }

        }

        public int GetCurrentUserId()
        {
            LoadClaims();
            return currentUserId;
        }

        public int GetCurrentCompanyIdUser()
        {
            LoadClaims();
            return currentCompanyIdUser;
        }
        #endregion

        #region Repository

        public async Task<ResponseMDTO> ExecStoreProcedure<T>(Dictionary<string, dynamic> parameters, string spName)
        {
            response.Data = await _SpModel.ExecStoreProcedure<T>(parameters, spName);

            return response;
        }

        /// <summary>
        /// Consulta todas las entidades
        /// </summary>
        public virtual IQueryable<TEntity> GetAll()
        {
            return _BaseModel.GetAll;
        }

        /// <summary>
        /// Consulta una entidad por id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public virtual TEntity FindById(object id)
        {
            return _BaseModel.FindById(id);
        }

        /// <summary>
        /// Realiza el insert sin guardar
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public virtual TEntity Insert(TEntity entity)
        {
            return _BaseModel.Insert(entity);
        }

        /// <summary>
        /// inserta un rango de entidades sin guardar
        /// </summary>
        /// <param name="entities"></param>
        /// <returns></returns>
        public virtual IEnumerable<TEntity> InsertRange(IEnumerable<TEntity> entities)
        {
            return _BaseModel.InsertRange(entities);
        }

        /// <summary>
        /// Crea un entidad (Guarda)
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public virtual TEntity Create(TEntity entity)
        {

            return _BaseModel.Create(entity);
        }

        /// <summary>
        /// Crea varias entidades (Guarda)
        /// </summary>
        /// <param name="entities"></param>
        /// <returns></returns>
        public virtual IEnumerable<TEntity> CreateBatch(IEnumerable<TEntity> entities)
        {
            return _BaseModel.CreateBatch(entities);
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
            return _BaseModel.Modify(editedEntity, originalEntity, out changed);
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
            return _BaseModel.Modify(editedEntity, originalEntity, out changed);
        }

        /// <summary>
        /// Remueve una entidad (No guarda)
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public virtual TEntity Remove(TEntity entity)
        {
            return _BaseModel.Remove(entity);
        }

        /// <summary>
        /// Remueve un rango de entidades (No guarda)
        /// </summary>
        /// <param name="entities"></param>
        /// <returns></returns>
        public virtual IEnumerable<TEntity> RemoveRange(IEnumerable<TEntity> entities)
        {
            return _BaseModel.RemoveRange(entities);
        }

        /// <summary>
        /// Elimina una entidad (Guarda)
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public virtual TEntity Delete(TEntity entity)
        {
            return _BaseModel.Delete(entity);
        }

        /// <summary>
        /// Elimina un rango de entidades  (Guarda)
        /// </summary>
        /// <param name="entities"></param>
        /// <returns></returns>
        public virtual IEnumerable<TEntity> DeleteBatch(IEnumerable<TEntity> entities)
        {
            return _BaseModel.DeleteBatch(entities);
        }

        /// <summary>
        /// Consulta todas las entidades por una condición
        /// </summary>
        /// <param name="condition"></param>
        /// <returns></returns>
        public virtual IQueryable<TEntity> GetAllBy(Expression<Func<TEntity, bool>> condition)
        {
            return _BaseModel.GetAllBy(condition);
        }

        /// <summary>
        /// Consulta una entidad por medio de una condición
        /// </summary>
        /// <param name="condition"></param>
        /// <returns></returns>

        public virtual TEntity GetBy(Expression<Func<TEntity, bool>> condition)
        {
            return _BaseModel.GetBy(condition);
        }

        /// <summary>
        /// Guardar cambios
        /// </summary>
        public virtual void SaveChanges()
        {
            _BaseModel.SaveChanges();
        }
        #endregion


    }
}
