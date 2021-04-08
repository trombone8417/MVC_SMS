using DatabaseAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC_SMS.Controllers
{
    /// <summary>
    /// 繳費報表
    /// </summary>
    public class FeeReportController : Controller
    {
        private SchoolMgtDbEntities db = new SchoolMgtDbEntities();
        // GET: FeeReport
        public ActionResult DateSubmissionFee()
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            var allsubmissionfee = db.SubmissionFeeTables.Where(e => e.SubmissionDate >= DateTime.Now && e.SubmissionDate <= DateTime.Now).ToList().OrderByDescending(e => e.SubmissionFeeID);
            
            return View(allsubmissionfee);
        }

        [HttpPost]
        public ActionResult DateSubmissionFee(DateTime fromDate, DateTime toDate)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            var allsubmissionfee = db.SubmissionFeeTables.Where(e => e.SubmissionDate >= fromDate && e.SubmissionDate <= toDate).ToList().OrderByDescending(e => e.SubmissionFeeID);
            return View(allsubmissionfee);
        }

        // GET: FeeReport
        public ActionResult DateStudentPromote()
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            var allstudentpromote = db.StudentPromoteTables.Where(e => e.PromoteDate >= DateTime.Now && e.PromoteDate <= DateTime.Now && e.IsSubmit==true).ToList().OrderByDescending(e => e.StudentPromoteID);

            return View(allstudentpromote);
        }

        [HttpPost]
        public ActionResult DateStudentPromote(DateTime fromDate, DateTime toDate)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            var allstudentpromote = db.StudentPromoteTables.Where(e => e.PromoteDate >= fromDate && e.PromoteDate <= toDate && e.IsSubmit == true).ToList().OrderByDescending(e => e.StudentPromoteID);
            return View(allstudentpromote);
        }
    }
}