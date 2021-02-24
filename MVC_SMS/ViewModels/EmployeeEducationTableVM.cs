using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC_SMS.ViewModels
{
    public class EmployeeEducationTableVM
    {
        public int EmployeeEducationID { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        public string InstituteUniversity { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        public string TitleOfDiploma { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        public string Degree { get; set; }
        [DataType(DataType.Date, ErrorMessage = "Date only")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [Required(ErrorMessage = "欄位不得為空")]
        public Nullable<System.DateTime> FromYear { get; set; }
        [DataType(DataType.Date, ErrorMessage = "Date only")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [Required(ErrorMessage = "欄位不得為空")]
        public Nullable<System.DateTime> ToYear { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        public string City { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        public string Country { get; set; }
        public Nullable<int> EmployeeResumeID { get; set; }
        public int UserID { get; set; }
        public List<SelectListItem> ListOfCountry { get; set; }
        public List<SelectListItem> ListOfCity { get; set; }
    }
}