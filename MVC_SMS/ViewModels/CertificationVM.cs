using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC_SMS.ViewModels
{
    public class CertificationVM
    {
        [Required(ErrorMessage = "Please Your Certification Name")]
        public string CertificationName { get; set; }
        [Required(ErrorMessage = "Please enter Certification Authority")]
        public string CertificationAuthority { get; set; }
        [Required(ErrorMessage = "Please select Certification Level")]
        public string LevelCertification { get; set; }
        [Required(ErrorMessage = "Please select achievement data")]
        public Nullable<System.DateTime> FromYear { get; set; }
        public List<SelectListItem> ListOfLevel { get; set; }
    }
}