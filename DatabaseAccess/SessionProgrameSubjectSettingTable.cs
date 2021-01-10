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

    public partial class SessionProgrameSubjectSettingTable
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SessionProgrameSubjectSettingTable()
        {
            this.ExamMarksTables = new HashSet<ExamMarksTable>();
        }
    
        public int SessionProgrameSubjectSettingID { get; set; }
        public int UserID { get; set; }
        public int SessionID { get; set; }
        public int ProgrameID { get; set; }
        public int AnnualID { get; set; }
        public int SubjectID { get; set; }
        [DataType(DataType.Date)]
        public System.DateTime RegDate { get; set; }
        public string Description { get; set; }
        public bool isActive { get; set; }
    
        public virtual AnnualTable AnnualTable { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ExamMarksTable> ExamMarksTables { get; set; }
        public virtual ProgrameTable ProgrameTable { get; set; }
        public virtual SessionTable SessionTable { get; set; }
        public virtual SubjectTable SubjectTable { get; set; }
        public virtual UserTable UserTable { get; set; }
    }
}