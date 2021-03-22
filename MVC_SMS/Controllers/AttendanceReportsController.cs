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
        public ActionResult StudentAttendance(int? id)
        {
            var classid = db.StudentPromoteTables.Where(p => p.StudentID == id && p.isActive == true).FirstOrDefault().ClassID;
            var studentattandance = db.AttendanceTables.Where(a => a.StudentID == id && a.ClassID == classid).OrderByDescending(a => a.AttendanceID);
            return View(studentattandance);
        }
    }
}