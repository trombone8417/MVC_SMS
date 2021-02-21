using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC_SMS.ViewModels
{
    public class PersonVM
    {
        
        public int IDpers { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        public string FirstName { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        public string LastName { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        public Nullable<System.DateTime> DateOfBirth { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        public string Nationality { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        public string EducationalLevel { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        public string Address { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        public string Tel { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        public string Email { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        [DataType(DataType.MultilineText)]
        public string Summary { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        [DataType(DataType.Url)]
        public string LikedInProfil { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        [DataType(DataType.Url)]
        public string FaceBookProfil { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        [DataType(DataType.Url)]
        public string C_CornerProfil { get; set; }
        [Required(ErrorMessage = "欄位不得為空")]
        [DataType(DataType.Url)]
        public string TwitterProfil { get; set; }
        public byte[] Profil { get; set; }
        public List<SelectListItem> ListNationality { get; set; }
        public List<SelectListItem> ListEducationalLevel { get; set; }
    }
}