using DatabaseAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC_SMS.Controllers
{
    public class StudentCertificateReportController : Controller
    {
        private SchoolMgtDbEntities db = new SchoolMgtDbEntities();
        // GET: StudentCertificateReport
        public ActionResult LeavingC(int? id)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            var student = db.StudentPromoteTables.Where(std => std.StudentID == id && std.isActive == true).FirstOrDefault();
            return View(student);
        }

        public ActionResult PrintLeavingC(int? id)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            var student = db.StudentPromoteTables.Where(std => std.StudentID == id && std.isActive == true).FirstOrDefault();
            if (student==null)
            {
                ViewBag.Message = "Already Print! Please Contact to Adminstration Department.";
                return View(new StudentPromoteTable()); 
            }
            student.isActive = false;
            db.Entry(student).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            ViewBag.Message = "Print Successfully";
            return View("LeavingC",student);
        }

    }
}