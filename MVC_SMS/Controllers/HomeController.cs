using DatabaseAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC_SMS.Controllers
{
    public class HomeController : Controller
    {
        private SchoolMgtDbEntities db = new SchoolMgtDbEntities();
        /// <summary>
        /// 登入頁面
        /// </summary>
        /// <returns></returns>
        public ActionResult Login()
        {
            
            return View();
        }
        /// <summary>
        /// 使用者登入
        /// </summary>
        /// <param name="email"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult LoginUser(string email, string password)
        {
            
            try
            {
                //確認email跟passwowrd是否為空值
                if(email != null && password != null)
                {
                    //資料庫撈取使用者的資料
                    var finduser = db.UserTables.Where(u => u.EmailAddress == email && u.Password == password).ToList();
                    //若有使用者的資料
                    if (finduser.Count() == 1)
                    {
                        //利用Session儲存使用者的資訊
                        Session["UserID"] = finduser[0].UserID;
                        Session["UserTypeID"] = finduser[0].UserTypeID;
                        Session["FullName"] = finduser[0].FullName;
                        Session["UserName"] = finduser[0].UserName;
                        Session["Password"] = finduser[0].Password;
                        Session["ContactNo"] = finduser[0].ContactNo;
                        Session["EmailAddress"] = finduser[0].EmailAddress;
                        Session["Address"] = finduser[0].Address;
                        var userid = (int)Session["UserID"];
                        //查詢學生的照片
                        var studentphoto = db.StudentTables.Where(s => s.UserID == userid).FirstOrDefault();
                        //若有學生的照片的話
                        if (studentphoto!=null)
                        {
                            //Session存學生的照片位址
                            Session["Photo"] = studentphoto.Photo;
                        }
                        else
                        {
                            //沒有的話查詢職員的資料
                            var employee = db.StaffTables.Where(e => e.UserID == finduser[0].UserID).FirstOrDefault();
                            //儲存職員的照片
                            Session["Photo"] = employee.Photo;
                        }
                        string url = string.Empty;
                        //使用者角色Operator
                        if (finduser[0].UserTypeID == 2)
                        {
                            return RedirectToAction("About");
                        }
                        //使用者角色Teacher
                        else if (finduser[0].UserTypeID == 3)
                        {
                            return RedirectToAction("About");
                        }
                        //使用者角色Student
                        else if (finduser[0].UserTypeID == 4)
                        {
                            return RedirectToAction("About");
                        }
                        //使用者角色Admin
                        else if (finduser[0].UserTypeID == 1)
                        {
                            url = "About";
                        }
                        //其他
                        else
                        {
                            url = "About";
                        }

                        return RedirectToAction(url);
                    }
                    else
                    {
                        Session["UserID"] = string.Empty;
                        Session["UserTypeID"] = string.Empty;
                        Session["FullName"] = string.Empty;
                        Session["UserName"] = string.Empty;
                        Session["Password"] = string.Empty;
                        Session["ContactNo"] = string.Empty;
                        Session["EmailAddress"] = string.Empty;
                        Session["Address"] = string.Empty;
                        ViewBag.message = "User Name and Password is incorrect!";
                    }

                }
                //若無使用者的資訊的話清空Session資訊
                else
                {
                    Session["UserID"] = string.Empty;
                    Session["UserTypeID"] = string.Empty;
                    Session["FullName"] = string.Empty;
                    Session["UserName"] = string.Empty;
                    Session["Password"] = string.Empty;
                    Session["ContactNo"] = string.Empty;
                    Session["EmailAddress"] = string.Empty;
                    Session["Address"] = string.Empty;
                    ViewBag.message = "Some unexpected issue is occure please try again!";
                }
            }
            catch(Exception ex)
            {
                //錯誤的話清空Session資訊
                Session["UserID"] = string.Empty;
                Session["UserTypeID"] = string.Empty;
                Session["FullName"] = string.Empty;
                Session["UserName"] = string.Empty;
                Session["Password"] = string.Empty;
                Session["ContactNo"] = string.Empty;
                Session["EmailAddress"] = string.Empty;
                Session["Address"] = string.Empty;
                ViewBag.message = "Some unexpected issue is occure please try again!";
            }
            return View("Login");
        }
        public ActionResult About()
        {
            ViewBag.Message = "歡迎來到校園資訊管理系統";

            return View();
        }
        /// <summary>
        /// 登出
        /// </summary>
        /// <returns></returns>
        public ActionResult Logout()
        {
            //清空使用者Session資訊
            Session["UserID"] = string.Empty;
            Session["UserTypeID"] = string.Empty;
            Session["FullName"] = string.Empty;
            Session["UserName"] = string.Empty;
            Session["Password"] = string.Empty;
            Session["ContactNo"] = string.Empty;
            Session["EmailAddress"] = string.Empty;
            Session["Address"] = string.Empty;

            return RedirectToAction("Login");
        }
    }
}