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

    public partial class ExpensesTable
    {
        public int ExpensesID { get; set; }
        public int ExpensesTypeID { get; set; }
        [DataType(DataType.Date, ErrorMessage = "Date only")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public System.DateTime ExpensesDate { get; set; }
        public double Amount { get; set; }
        public string Reason { get; set; }
        public int UserID { get; set; }
    
        public virtual ExpenseTypeTable ExpenseTypeTable { get; set; }
        public virtual UserTable UserTable { get; set; }
    }
}
