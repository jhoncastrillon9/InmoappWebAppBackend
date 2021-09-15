using Microsoft.EntityFrameworkCore;
using System.Reflection;

namespace DataAccess
{
    public class InmoappContext : DbContext
    {
        public InmoappContext()
        {

        }

        public InmoappContext(DbContextOptions<InmoappContext> options) : base(options)
        {

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
           
        }
    }
}
