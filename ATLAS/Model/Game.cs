//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Game
    {
        public Game()
        {
            this.Name = "\"\"";
            this.URL = "\"\"";
            this.Players = new HashSet<Player>();
        }
    
        public long GameID { get; set; }
        public string Name { get; set; }
        public string URL { get; set; }
    
        public virtual ICollection<Player> Players { get; set; }
    }
}
