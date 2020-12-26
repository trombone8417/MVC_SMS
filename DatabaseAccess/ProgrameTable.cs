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

    public partial class ProgrameTable
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ProgrameTable()
        {
            this.AnnualTables = new HashSet<AnnualTable>();
            this.ProgrameSessionTables = new HashSet<ProgrameSessionTable>();
            this.SessionProgrameSubjectSettingTables = new HashSet<SessionProgrameSubjectSettingTable>();
            this.StudentTables = new HashSet<StudentTable>();
            this.SubmissionFeeTables = new HashSet<SubmissionFeeTable>();
        }
    
        public int ProgrameID { get; set; }
        public int UserID { get; set; }
        public string Name { get; set; }
        [DataType(DataType.Date)]
        public System.DateTime StartDate { get; set; }
        public bool IsActive { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AnnualTable> AnnualTables { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProgrameSessionTable> ProgrameSessionTables { get; set; }
        public virtual UserTable UserTable { get; set; }
        public virtual UserTable UserTable1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SessionProgrameSubjectSettingTable> SessionProgrameSubjectSettingTables { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<StudentTable> StudentTables { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SubmissionFeeTable> SubmissionFeeTables { get; set; }
    }
}
