using DatabaseAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC_SMS.Controllers
{
    public class FeeReportController : Controller
    {
        private SchoolMgtDbEntities db = new SchoolMgtDbEntities();
        // GET: FeeReport
        public ActionResult DateSubmissionFee()
        {
            var allsubmissionfee = db.SubmissionFeeTables.Where(e => e.SubmissionDate >= DateTime.Now && e.SubmissionDate <= DateTime.Now).ToList().OrderByDescending(e => e.SubmissionFeeID);
            
            return View(allsubmissionfee);
        }

        [HttpPost]
        public ActionResult DateSubmissionFee(DateTime fromDate, DateTime toDate)
        {
            var allsubmissionfee = db.SubmissionFeeTables.Where(e => e.SubmissionDate >= fromDate && e.SubmissionDate <= toDate).ToList().OrderByDescending(e => e.SubmissionFeeID);
            return View(allsubmissionfee);
        }

        // GET: FeeReport
        public ActionResult DateStudentPromote()
        {
            var allstudentpromote = db.StudentPromoteTables.Where(e => e.PromoteDate >= DateTime.Now && e.PromoteDate <= DateTime.Now).ToList().OrderByDescending(e => e.StudentPromoteID);

            return View(allstudentpromote);
        }

        [HttpPost]
        public ActionResult DateStudentPromote(DateTime fromDate, DateTime toDate)
        {
            var allstudentpromote = db.StudentPromoteTables.Where(e => e.PromoteDate >= fromDate && e.PromoteDate <= toDate).ToList().OrderByDescending(e => e.StudentPromoteID);
            return View(allstudentpromote);
        }
    }
}