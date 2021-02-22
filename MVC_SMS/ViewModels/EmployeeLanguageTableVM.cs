using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC_SMS.ViewModels
{
    public class EmployeeLanguageTableVM
    {
        public int EmployeeLanguageID { get; set; }
        public string LanguageName { get; set; }
        public string Proficiency { get; set; }
        public Nullable<int> EmployeeResumeID { get; set; }
        public int UserID { get; set; }
        public List<SelectListItem> ListOfProficiency { get; set; }
    }
}