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
    public partial class SubmissionFeeTable
    {
        public int SubmissionFeeID { get; set; }
        public int UserID { get; set; }
        public int StudentID { get; set; }
        public double Amount { get; set; }
        public int ProgrameID { get; set; }
        [DataType(DataType.Date, ErrorMessage = "Date only")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public System.DateTime SubmissionDate { get; set; }
        public string FeesMonth { get; set; }
        public string Description { get; set; }
        public int ClassID { get; set; }
    
        public virtual ClassTable ClassTable { get; set; }
        public virtual ProgrameTable ProgrameTable { get; set; }
        public virtual StudentTable StudentTable { get; set; }
        public virtual UserTable UserTable { get; set; }
    }
}
