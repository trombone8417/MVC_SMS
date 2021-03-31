using DatabaseAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC_SMS.Controllers
{
    public class ExamReportController : Controller
    {
        private SchoolMgtDbEntities db = new SchoolMgtDbEntities();
        public ActionResult PrintDMC()
        {
            ViewBag.ExamID = new SelectList(db.ExamTables, "ExamID", "Title");
            return View(new List<ExamMarksTable>());
        }
        // GET: ExamReport
        [HttpPost()]
        public ActionResult PrintDMC(int? promoteid,int? examid)
        {
            ViewBag.ExamID = new SelectList(db.ExamTables, "ExamID", "Title");
            var promoterecord = db.StudentPromoteTables.Find(promoteid);
            if (promoterecord!=null)
            {
                var listmarks = db.ExamMarksTables.Where(e => e.ClassSubjectTable.ClassID == promoterecord.ClassID&&e.StudentID==promoterecord.StudentID);
                return View(listmarks);
            }
            return View(new ExamMarksTable());
        }
    }
}