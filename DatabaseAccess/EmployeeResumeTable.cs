//------------------------------------------------------------------------------
// <auto-generated>
//     這個程式碼是由範本產生。
//
//     對這個檔案進行手動變更可能導致您的應用程式產生未預期的行為。
//     如果重新產生程式碼，將會覆寫對這個檔案的手動變更。
// </auto-generated>
//------------------------------------------------------------------------------

namespace DatabaseAccess
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    public partial class EmployeeResumeTable
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public EmployeeResumeTable()
        {
            this.EmployeeCertificationTables = new HashSet<EmployeeCertificationTable>();
            this.EmployeeEducationTables = new HashSet<EmployeeEducationTable>();
            this.EmployeeLanguageTables = new HashSet<EmployeeLanguageTable>();
            this.EmployeeSkillTables = new HashSet<EmployeeSkillTable>();
            this.EmployeeWorkExperienceTables = new HashSet<EmployeeWorkExperienceTable>();
        }
    
        public int EmployeeResumeID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        [DataType(DataType.Date, ErrorMessage = "Date only")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> DateOfBirth { get; set; }
        public string Nationality { get; set; }
        public string EducationalLevel { get; set; }
        public string Address { get; set; }
        public string Tel { get; set; }
        public string Email { get; set; }
        public string Summary { get; set; }
        public string LinkedInProdil { get; set; }
        public string FaceBookProfil { get; set; }
        public string C_CornerProfil { get; set; }
        public string TwitterProfil { get; set; }
        public byte[] Profil { get; set; }
        public Nullable<int> EmployeeID { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EmployeeCertificationTable> EmployeeCertificationTables { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EmployeeEducationTable> EmployeeEducationTables { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EmployeeLanguageTable> EmployeeLanguageTables { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EmployeeSkillTable> EmployeeSkillTables { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EmployeeWorkExperienceTable> EmployeeWorkExperienceTables { get; set; }
    }
}