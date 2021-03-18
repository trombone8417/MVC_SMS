using DatabaseAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC_SMS.Controllers
{
    public class TimeTableReportsController : Controller
    {
        private SchoolMgtDbEntities db = new SchoolMgtDbEntities();
        // GET: TimeTableReports
        public ActionResult TeacherReport(int? id)
        {
            var teacherclas = db.TimeTblTables.Where(t => t.StaffID == id).OrderByDescending(e => e.TimeTableID);
            return View(teacherclas);
        }
    }
}