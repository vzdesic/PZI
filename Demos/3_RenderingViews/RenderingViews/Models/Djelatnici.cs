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
    
    public partial class Djelatnici
    {
        public Djelatnici()
        {
            this.Posudbes = new HashSet<Posudbe>();
        }
    
        public int ID { get; set; }
        public string Ime { get; set; }
        public string Prezime { get; set; }
        public Nullable<System.DateTime> DatumRodenja { get; set; }
        public string OIB { get; set; }
        public Nullable<System.DateTime> DatumZaposlenja { get; set; }
    
        public virtual ICollection<Posudbe> Posudbes { get; set; }
    }
}
