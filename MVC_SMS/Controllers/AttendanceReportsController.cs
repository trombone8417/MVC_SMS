using DatabaseAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC_SMS.Controllers
{
    public class AttendanceReportsController : Controller
    {
        private SchoolMgtDbEntities db = new SchoolMgtDbEntities();
        // GET: AttendanceReports
        /// <summary>
        /// 學生上課點名(個人)
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult StudentAttendance(int? id)
        {
            var classid = db.StudentPromoteTables.Where(p => p.StudentID == id && p.isActive == true).FirstOrDefault().ClassID;
            var studentattandance = db.AttendanceTables.Where(a => a.StudentID == id && a.ClassID == classid).OrderByDescending(a => a.AttendanceID);
            return View(studentattandance);
        }
        /// <summary>
        /// 職員打卡紀錄(個人)
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult StaffAttendance(int? id)
        {
            var staffattandance = db.StaffAttendanceTables.Where(a => a.StaffID == id).OrderByDescending(a => a.StaffID);
            return View(staffattandance);
        }
    }
}