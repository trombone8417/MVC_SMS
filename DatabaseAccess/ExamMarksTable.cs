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
    
    public partial class ExamMarksTable
    {
        public int MarksID { get; set; }
        public int SessionProgrameSubjectSettingID { get; set; }
        public int ExamID { get; set; }
        public int ExamSettingID { get; set; }
        public int SubjectID { get; set; }
        public int StudentID { get; set; }
        public int UserID { get; set; }
        public int TotalMarks { get; set; }
        public int ObtainMarks { get; set; }
    
        public virtual ExamSettingTable ExamSettingTable { get; set; }
        public virtual SessionProgrameSubjectSettingTable SessionProgrameSubjectSettingTable { get; set; }
        public virtual StudentTable StudentTable { get; set; }
        public virtual SubjectTable SubjectTable { get; set; }
        public virtual UserTable UserTable { get; set; }
    }
}
