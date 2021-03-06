﻿using DatabaseAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC_SMS.Controllers
{
    /// <summary>
    /// 考試報表
    /// </summary>
    public class ExamReportController : Controller
    {
        private SchoolMgtDbEntities db = new SchoolMgtDbEntities();
        /// <summary>
        /// 考試報表(get)
        /// </summary>
        /// <returns></returns>
        public ActionResult PrintDMC()
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            ViewBag.ExamID = new SelectList(db.ExamTables, "ExamID", "Title");
            return View(new List<ExamMarksTable>());
        }
        // GET: ExamReport
        /// <summary>
        /// 考試報表(post)
        /// </summary>
        /// <param name="promoteid"></param>
        /// <param name="examid"></param>
        /// <returns></returns>
        [HttpPost()]
        public ActionResult PrintDMC(int? promoteid,int? examid)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
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