﻿using System;
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
        public string InstituteUniversity { get; set; }
        public string TitleOfDiploma { get; set; }
        public string Degree { get; set; }
        [DataType(DataType.Date, ErrorMessage = "Date only")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> FromYear { get; set; }
        [DataType(DataType.Date, ErrorMessage = "Date only")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> ToYear { get; set; }
        public string City { get; set; }
        public string Country { get; set; }
        public Nullable<int> EmployeeResumeID { get; set; }
        public int UserID { get; set; }
        public List<SelectListItem> ListOfCountry { get; set; }
        public List<SelectListItem> ListOfCity { get; set; }
    }
}