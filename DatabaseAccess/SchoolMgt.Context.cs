﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class SchoolMgtDbEntities : DbContext
    {
        public SchoolMgtDbEntities()
            : base("name=SchoolMgtDbEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<AnnualTable> AnnualTables { get; set; }
        public virtual DbSet<AttendanceTable> AttendanceTables { get; set; }
        public virtual DbSet<DesignationTable> DesignationTables { get; set; }
        public virtual DbSet<ExamMarksTable> ExamMarksTables { get; set; }
        public virtual DbSet<ExamSettingTable> ExamSettingTables { get; set; }
        public virtual DbSet<ExamTable> ExamTables { get; set; }
        public virtual DbSet<ProgrameSessionTable> ProgrameSessionTables { get; set; }
        public virtual DbSet<ProgrameTable> ProgrameTables { get; set; }
        public virtual DbSet<SessionProgrameSubjectSettingTable> SessionProgrameSubjectSettingTables { get; set; }
        public virtual DbSet<SessionTable> SessionTables { get; set; }
        public virtual DbSet<StaffAttendanceTable> StaffAttendanceTables { get; set; }
        public virtual DbSet<StaffTable> StaffTables { get; set; }
        public virtual DbSet<StudentTable> StudentTables { get; set; }
        public virtual DbSet<SubjectTable> SubjectTables { get; set; }
        public virtual DbSet<SubmissionFeeTable> SubmissionFeeTables { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<TimeTblTable> TimeTblTables { get; set; }
        public virtual DbSet<UserTable> UserTables { get; set; }
        public virtual DbSet<UserTypeTable> UserTypeTables { get; set; }
        public virtual DbSet<ClassTable> ClassTables { get; set; }
        public virtual DbSet<StudentPromoteTable> StudentPromoteTables { get; set; }
    }
}
