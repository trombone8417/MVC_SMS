﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVC_SMS.ViewModels
{
    public class EmployeeSkillTableVM
    {
        public int EmployeeSkillID { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        public string SkillName { get; set; }
        public Nullable<int> EmployeeResumeID { get; set; }
        public int UserID { get; set; }
    }
}