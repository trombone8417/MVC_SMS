using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC_SMS.ViewModels
{
    public class WorkExperienceVM
    {
        public int IDExp { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        public string Company { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        public string Title { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        public string Country { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        public Nullable<System.DateTime> FromYear { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        public Nullable<System.DateTime> ToYear { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        [DataType(DataType.MultilineText)]
        public string Description { get; set; }

        public List<SelectListItem> ListOfCountries { get; set; }
    }
}