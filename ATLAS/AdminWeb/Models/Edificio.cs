using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace AdminWeb.Models
{
    public class Edificio
    {
        public int ID { get; set; }
        public string nombre { get; set; }
        public string resistencia { get; set; }
        public string ataque { get; set; }
        public string foto { get; set; }

    }
    public class EdificiosDBContext : DbContext
    {
        public DbSet<Edificio> Edificios { get; set; }
    }
    
}