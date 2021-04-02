using DatabaseAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC_SMS.Controllers
{
    /// <summary>
    /// 出勤報表
    /// </summary>
    public class AttendanceReportsController : Controller
    {
        private SchoolMgtDbEntities db = new SchoolMgtDbEntities();

        // GET: AttendanceReports
        /// <summary>
        /// 學生上課點名(個人)
        /// button 在 StudentTables Index
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult StudentAttendance(int? id)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            if (id == 0)
            {
                int userid = Convert.ToInt32(Convert.ToString(Session["UserID"]));
                id = db.StudentTables.Where(e => e.UserID == userid).FirstOrDefault().StudentID;
            }
            var classid = db.StudentPromoteTables.Where(p => p.StudentID == id && p.isActive == true).FirstOrDefault().ClassID;
            var studentattandance = db.AttendanceTables.Where(a => a.StudentID == id && a.ClassID == classid).OrderByDescending(a => a.ClassID).ThenByDescending(a=>a.StudentID);
            return View(studentattandance);
        }
        /// <summary>
        /// 全部學生出勤
        /// </summary>
        /// <returns></returns>
        public ActionResult AllStudentAttendance()
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            var studentattandance = db.AttendanceTables.OrderByDescending(a => a.ClassID).ThenByDescending(a => a.StudentID);
            return View(studentattandance);
        }
        /// <summary>
        /// 職員打卡紀錄(個人)
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult StaffAttendance(int? id)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            if (id == 0)
            {
                int userid = Convert.ToInt32(Convert.ToString(Session["UserID"]));
                id = db.StaffTables.Where(e => e.UserID == userid).FirstOrDefault().StaffID;
            }
            var staffattandance = db.StaffAttendanceTables.Where(a => a.StaffID == id).OrderByDescending(a => a.StaffID);
            return View(staffattandance);
        }
        /// <summary>
        /// 全部職員出勤
        /// </summary>
        /// <returns></returns>
        public ActionResult AllStaffAttendance()
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            var staffattandance = db.StaffAttendanceTables.OrderByDescending(a => a.StaffID);
            return View(staffattandance);
        }
    }
}