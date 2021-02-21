using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVC_SMS.Models
{
    public partial class Person
    {
        public Person()
        {
            this.Certifications = new HashSet<Certification>();
            this.Educations = new HashSet<Education>();
            this.Languages = new HashSet<Language>();
            this.Skills = new HashSet<Skill>();
            this.WorkExperiences = new HashSet<WorkExperience>();
        }

        [Key]
        public int IDpers { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public Nullable<System.DateTime> DateOfBirth { get; set; }
        public string Nationality { get; set; }
        public string EducationalLevel { get; set; }
        public string Address { get; set; }
        public string Tel { get; set; }
        public string Email { get; set; }
        public string Summary { get; set; }
        public string LikedInProfil { get; set; }
        public string FaceBookProfil { get; set; }
        public string C_CornerProfil { get; set; }
        public string TwitterProfil { get; set; }
        public byte[] Profil { get; set; }
        public Nullable<int> EmpID { get; set; }
        public virtual ICollection<Certification> Certifications { get; set; }
        public virtual ICollection<Education> Educations { get; set; }
        public virtual ICollection<Language> Languages { get; set; }
        public virtual ICollection<Skill> Skills { get; set; }
        public virtual ICollection<WorkExperience> WorkExperiences { get; set; }
    }
}