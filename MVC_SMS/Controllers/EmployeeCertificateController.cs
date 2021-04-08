using DatabaseAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC_SMS.Controllers
{
    /// <summary>
    /// 教職員離職證明書
    /// </summary>
    public class EmployeeCertificateController : Controller
    {
        private SchoolMgtDbEntities db = new SchoolMgtDbEntities();
        // GET: EmployeeCertificate
        /// <summary>
        /// 離職證明書
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult ExperienceC(int? id)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            var employee = db.StaffTables.Where(s => s.StaffID == id).FirstOrDefault();
            ViewBag.FromDate = employee.RegistrationDate?.ToString("yyyy/MM/dd");
            if (employee.StaffAttendanceTables!=null)
            {

            ViewBag.ToDate = employee.StaffAttendanceTables.OrderByDescending(s => s.AttendDate).FirstOrDefault().AttendDate;
            }
            else
            {
                ViewBag.ToDate = DateTime.Now.ToString("yyyy/MM/dd");
            }

            return View(employee);
        }
    }
}