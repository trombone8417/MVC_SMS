using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC_SMS.ViewModels
{
    public class EmployeeWorkExperienceTableVM
    {
        public int EmployeeWorkExperienceID { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        public string Company { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        public string Title { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        public string Country { get; set; }
        [DataType(DataType.Date, ErrorMessage = "Date only")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [Required(ErrorMessage = "欄位不得為空")]
        public Nullable<System.DateTime> FromYear { get; set; }
        [DataType(DataType.Date, ErrorMessage = "Date only")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [Required(ErrorMessage = "欄位不得為空")]
        public Nullable<System.DateTime> ToYear { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        public string Description { get; set; }
        public Nullable<int> EmployeeResumeID { get; set; }
        public int UserID { get; set; }

        public List<SelectListItem> ListOfCountries { get; set; }
    }
}