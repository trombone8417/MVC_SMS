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

        
    }
}