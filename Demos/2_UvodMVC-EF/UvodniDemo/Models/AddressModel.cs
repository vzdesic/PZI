using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace UvodniDemo.Models
{
    public class AddressModel
    {        
        [Required(ErrorMessage="Obavezno je upisati adresu 1.")]
        [StringLength(10, ErrorMessage="Adresa 1 ne smije biti duža od 10 znakova.")]
        public string AddressLine1 { get; set; }

        [Required(ErrorMessage = "Obavezno je upisati adresu 2.")]
        public string AddressLine2 { get; set; }
    }
}