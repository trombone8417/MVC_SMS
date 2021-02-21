using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC_SMS.ViewModels
{
    public class LanguageVM
    {
        [Required(ErrorMessage = "欄位不得為空")]
        public string LanguageName { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        public string Proficiency { get; set; }
        public List<SelectListItem> ListOfProficiency { get; set; }
    }
}