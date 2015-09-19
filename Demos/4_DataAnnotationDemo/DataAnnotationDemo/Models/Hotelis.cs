using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace DataAnnotationDemo.Models
{
    [MetadataType(typeof(HoteliMetadata))]
    public partial class Hoteli
    {

    }

    public partial class HoteliMetadata
    {
        [Editable(false)]
        public int ID { get; set; }

        [Required(ErrorMessage = "Obavezno unesite naziv hotela.")]
        [Display(Name = "Naziv hotela")]
        public string Naziv { get; set; }

        [Required(ErrorMessage = "Obavezno unesite adresu hotela.")]
        [Display(Name = "Adresa hotela")]
        public string Adresa { get; set; }

        [Range(typeof(int), "1", "1000")]
        public int GradID { get; set; }
    }
}