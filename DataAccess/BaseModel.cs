using DataAccess.Data;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;

namespace DataAccess
{
    public class BaseModel<TEntity> where TEntity : class, new()
    {
        /// <summary>
        /// Contexto
        /// </summary>
        InmmoAppContext _context;
        /// <summary>
        /// Entidad
        /// </summary>
        protected DbSet<TEntity> _dbSet;

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="context"></param>
        public BaseModel(InmmoAppContext context)
        {
            _context = context;
            _dbSet = _context.Set<TEntity>();
        }


        /// <summary>
        /// Consulta todas las entidades
        /// </summary>
        public virtual IQueryable<TEntity> GetAll
        {
            get { return _dbSet; }
        }

        /// <summary>
        /// Consulta una entidad por id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public virtual TEntity FindById(object id)
        {
            return _dbSet.Find(id);
        }

        /// <summary>
        /// Realiza el insert sin guardar
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public virtual TEntity Insert(TEntity entity)
        {
            _dbSet.Add(entity);

            return entity;
        }

        /// <summary>
        /// inserta un rango de entidades sin guardar
        /// </summary>
        /// <param name="entities"></param>
        /// <returns></returns>
        public virtual IEnumerable<TEntity> InsertRange(IEnumerable<TEntity> entities)
        {
            _dbSet.AddRange(entities);

            return entities;
        }

        /// <summary>
        /// Crea un entidad (Guarda)
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public virtual TEntity Create(TEntity entity)
        {
            _dbSet.Add(entity);
            _context.SaveChanges();

            return entity;
        }

        /// <summary>
        /// Crea varias entidades (Guarda)
        /// </summary>
        /// <param name="entities"></param>
        /// <returns></returns>
        public virtual IEnumerable<TEntity> CreateBatch(IEnumerable<TEntity> entities)
        {
            _dbSet.AddRange(entities);
            _context.SaveChanges();

            return entities;
        }

        /// <summary>
        /// Actualiza la entidad (NO GUARDA)
        /// </summary>
        /// <param name="editedEntity">Entidad editada</param>
        /// <param name="originalEntity">Entidad Original sin cambios</param>
        /// <param name="changed">Indica si se modifico la entidad</param>
        /// <returns></returns>
        public virtual TEntity Modify(TEntity editedEntity, TEntity originalEntity, out bool changed)
        {

            _context.Entry(originalEntity).CurrentValues.SetValues(editedEntity);

            changed = _context.Entry(originalEntity).State == EntityState.Modified;

            return originalEntity;
        }

        /// <summary>
        /// Actualiza la entidad (GUARDA)
        /// </summary>
        /// <param name="editedEntity">Entidad editada</param>
        /// <param name="originalEntity">Entidad Original sin cambios</param>
        /// <param name="changed">Indica si se modifico la entidad</param>
        /// <returns></returns>
        public virtual TEntity Update(TEntity editedEntity, TEntity originalEntity, out bool changed)
        {

            _context.Entry(originalEntity).CurrentValues.SetValues(editedEntity);

            changed = _context.Entry(originalEntity).State == EntityState.Modified;

            _context.SaveChanges();

            return originalEntity;
        }

        /// <summary>
        /// Remueve una entidad (No guarda)
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public virtual TEntity Remove(TEntity entity)
        {
            _dbSet.Remove(entity);

            return entity;
        }

        /// <summary>
        /// Remueve un rango de entidades (No guarda)
        /// </summary>
        /// <param name="entities"></param>
        /// <returns></returns>
        public virtual IEnumerable<TEntity> RemoveRange(IEnumerable<TEntity> entities)
        {
            _dbSet.RemoveRange(entities);

            return entities;
        }

        /// <summary>
        /// Elimina una entidad (Guarda)
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public virtual TEntity Delete(TEntity entity)
        {
            _dbSet.Remove(entity);

            _context.SaveChanges();

            return entity;
        }

        /// <summary>
        /// Elimina un rango de entidades  (Guarda)
        /// </summary>
        /// <param name="entities"></param>
        /// <returns></returns>
        public virtual IEnumerable<TEntity> DeleteBatch(IEnumerable<TEntity> entities)
        {
            _dbSet.RemoveRange(entities);

            _context.SaveChanges();

            return entities;
        }

        /// <summary>
        /// Consulta todas las entidades por una condición
        /// </summary>
        /// <param name="condition"></param>
        /// <returns></returns>
        public virtual IQueryable<TEntity> GetAllBy(Expression<Func<TEntity, bool>> condition)
        {
            return _dbSet.Where(condition);
        }

        /// <summary>
        /// Consulta una entidad por medio de una condición
        /// </summary>
        /// <param name="condition"></param>
        /// <returns></returns>

        public virtual TEntity GetBy(Expression<Func<TEntity, bool>> condition)
        {
            return _dbSet.FirstOrDefault(condition);
        }

        /// <summary>
        /// Guardar cambios
        /// </summary>
        public virtual void SaveChanges()
        {
            _context.SaveChanges();
        }
    }
}
