using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC_SMS.ViewModels
{
    public class EmployeeCertificationTableVM
    {
        public int EmployeeCertificationID { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        public string CertificationName { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        public string CertificationAuthority { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        public string LevelCertification { get; set; }
        [DataType(DataType.Date, ErrorMessage = "Date only")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [Required(ErrorMessage = "欄位不得為空")]
        public Nullable<System.DateTime> FromYear { get; set; }
        public Nullable<int> EmployeeResumeID { get; set; }
        public int UserID { get; set; }
        public List<SelectListItem> ListOfLevel { get; set; }
    }
}