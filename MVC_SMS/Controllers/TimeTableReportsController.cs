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
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            var teacherclas = db.TimeTblTables.Where(t => t.StaffID == id).OrderByDescending(e => e.TimeTableID);
            return View(teacherclas);
        }
        public ActionResult TeacherWiseReport()
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            var teacherclas = db.TimeTblTables.Where(t => t.IsActive == true).OrderBy(e => e.StaffID);
            return View(teacherclas);
        }
        public ActionResult StudentReport(int? id)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            var classid = db.StudentPromoteTables.Where(p => p.SectionID == id && p.isActive == true).FirstOrDefault().ClassID;
            var subjectime = db.TimeTblTables.Where(t => t.ClassSubjectTable.ClassID == classid && t.IsActive == true);
            return View(subjectime);
        }
    }
}