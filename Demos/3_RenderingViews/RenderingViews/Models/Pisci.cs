//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace RenderingViews.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Pisci
    {
        public Pisci()
        {
            this.Knjiges = new HashSet<Knjige>();
        }
    
        public int ID { get; set; }
        public string Ime { get; set; }
        public string Prezime { get; set; }
        public string Država { get; set; }
    
        public virtual ICollection<Knjige> Knjiges { get; set; }
    }
}
