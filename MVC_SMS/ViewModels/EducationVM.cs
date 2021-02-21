using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC_SMS.ViewModels
{
    public class EducationVM
    {
        public int IDEdu { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        public string InstituteUniversity { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        public string TitleOfDiploma { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        public string Degree { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        public Nullable<System.DateTime> FromYear { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        public Nullable<System.DateTime> ToYear { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        public string City { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        public string Country { get; set; }
        public List<SelectListItem> ListOfCountry { get; set; }
        public List<SelectListItem> ListOfCity { get; set; }
    }
}