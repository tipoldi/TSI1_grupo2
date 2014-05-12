using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace AdminWeb.Models
{
    public class Unidades
    {
        public int ID { get; set; }
        public string nombre { get; set; }
        public string resistencia { get; set; }
        public string ataque { get; set; }
        public string foto { get; set; }
        public string movilidad { get; set; }

    }
    public class UnidadesDBContext : DbContext
    {
        public DbSet<Unidades> Unidades { get; set; }
    }
}