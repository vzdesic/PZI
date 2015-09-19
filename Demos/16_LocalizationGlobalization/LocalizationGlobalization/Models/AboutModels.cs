using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace LocalizationGlobalization.Models
{
    public class AboutModel
    {
        [Display(ResourceType = (typeof(LocalizationGlobalization.Views.Home.App_LocalResources.About)), Name = "EmailName")]
        [Required(ErrorMessageResourceType = (typeof(LocalizationGlobalization.Views.Home.App_LocalResources.About)), ErrorMessageResourceName = "EmailRequired")]
        public string Email { get; set; }

        [Display(ResourceType = (typeof(LocalizationGlobalization.Views.Home.App_LocalResources.About)), Name = "PhoneName")]
        [Required(ErrorMessageResourceType = (typeof(LocalizationGlobalization.Views.Home.App_LocalResources.About)), ErrorMessageResourceName = "PhoneRequired")]
        public string Phone { get; set; }
    }
}