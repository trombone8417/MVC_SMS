using DatabaseAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC_SMS.Controllers
{
    public class ExpenseReportController : Controller
    {
        private SchoolMgtDbEntities db = new SchoolMgtDbEntities();
        // GET: ExpenseReport
        public ActionResult AllExpenses()
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            var allexpense = db.ExpensesTables.ToList().OrderByDescending(e => e.ExpensesID);
            return View(allexpense);
        }
        public ActionResult DateExpenses()
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            var allexpense = db.ExpensesTables.Where(e => e.ExpensesDate >= DateTime.Now && e.ExpensesDate <= DateTime.Now).ToList().OrderByDescending(e => e.ExpensesID);
            return View(allexpense);
        }
        [HttpPost]
        public ActionResult DateExpenses(DateTime fromDate, DateTime toDate)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            var allexpense = db.ExpensesTables.Where(e=>e.ExpensesDate>=fromDate&&e.ExpensesDate<=toDate).ToList().OrderByDescending(e => e.ExpensesID);
            return View(allexpense);
        }
    }
}