using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity_framework_core
{
    internal class ProdDbMus : DbContext
    {
        public DbSet<Songs> Ev_song { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder builder) => builder.UseSqlServer(@"Data Source=(localdb)\.;Initial Catalog=data");
    }
}