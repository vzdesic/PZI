//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataAnnotationDemo.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Racuni
    {
        public int ID { get; set; }
        public string Broj { get; set; }
        public int PolaznikID { get; set; }
        public bool Placeno { get; set; }
    
        public virtual Polaznici Polaznici { get; set; }
    }
}
