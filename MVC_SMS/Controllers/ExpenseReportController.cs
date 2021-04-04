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
    public class ExpenseReportController : Controller
    {
        private SchoolMgtDbEntities db = new SchoolMgtDbEntities();
        // GET: ExpenseReport
        /// <summary>
        /// 全部繳費
        /// </summary>
        /// <returns></returns>
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
        /// <summary>
        /// 繳費時間搜尋(get)
        /// </summary>
        /// <returns></returns>
        public ActionResult DateExpenses()
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            //預設今天日期
            var allexpense = db.ExpensesTables.Where(e => e.ExpensesDate >= DateTime.Now && e.ExpensesDate <= DateTime.Now).ToList().OrderByDescending(e => e.ExpensesID);
            return View(allexpense);
        }
        /// <summary>
        /// 繳費時間搜尋(post)
        /// </summary>
        /// <param name="fromDate">起始時間</param>
        /// <param name="toDate">結束時間</param>
        /// <returns></returns>
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