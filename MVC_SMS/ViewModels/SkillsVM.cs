using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVC_SMS.ViewModels
{
    public class SkillsVM
    {
        [Required(ErrorMessage = "欄位不得為空")]
        public string SkillName { get; set; }
    }
}