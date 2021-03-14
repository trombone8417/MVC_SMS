using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DatabaseAccess;

namespace MVC_SMS.Controllers
{
    public class TimeTblTablesController : Controller
    {
        private SchoolMgtDbEntities db = new SchoolMgtDbEntities();

        // GET: TimeTblTables
        public ActionResult Index()
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            var timeTblTables = db.TimeTblTables.Include(t => t.ClassSubjectTable).Include(t => t.StaffTable).Include(t => t.UserTable);
            return View(timeTblTables.ToList());
        }

        // GET: TimeTblTables/Details/5
        public ActionResult Details(int? id)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TimeTblTable timeTblTable = db.TimeTblTables.Find(id);
            if (timeTblTable == null)
            {
                return HttpNotFound();
            }
            return View(timeTblTable);
        }

        // GET: TimeTblTables/Create
        public ActionResult Create()
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            ViewBag.ClassSubjectID = new SelectList(db.ClassSubjectTables.Where(s => s.IsActive == true), "ClassSubjectID", "Name");
            ViewBag.StaffID = new SelectList(db.StaffTables.Where(s=>s.IsActive==true), "StaffID", "Name");
            ViewBag.UserID = new SelectList(db.UserTables, "UserID", "FullName");
            return View();
        }

        // POST: TimeTblTables/Create
        // 若要避免過量張貼攻擊，請啟用您要繫結的特定屬性。
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(TimeTblTable timeTblTable)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            int userid = Convert.ToInt32(Convert.ToString(Session["UserID"]));
            timeTblTable.UserID = userid;
            if (ModelState.IsValid)
            {
                db.TimeTblTables.Add(timeTblTable);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ClassSubjectID = new SelectList(db.ClassSubjectTables.Where(s => s.IsActive == true), "ClassSubjectID", "Name", timeTblTable.ClassSubjectID);
            ViewBag.StaffID = new SelectList(db.StaffTables.Where(s => s.IsActive == true), "StaffID", "Name", timeTblTable.StaffID);
            ViewBag.UserID = new SelectList(db.UserTables, "UserID", "FullName", timeTblTable.UserID);
            return View(timeTblTable);
        }

        // GET: TimeTblTables/Edit/5
        public ActionResult Edit(int? id)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TimeTblTable timeTblTable = db.TimeTblTables.Find(id);
            if (timeTblTable == null)
            {
                return HttpNotFound();
            }
            ViewBag.ClassSubjectID = new SelectList(db.ClassSubjectTables.Where(s => s.IsActive == true), "ClassSubjectID", "Name", timeTblTable.ClassSubjectID);
            ViewBag.StaffID = new SelectList(db.StaffTables.Where(s => s.IsActive == true), "StaffID", "Name", timeTblTable.StaffID);
            ViewBag.UserID = new SelectList(db.UserTables, "UserID", "FullName", timeTblTable.UserID);
            return View(timeTblTable);
        }

        // POST: TimeTblTables/Edit/5
        // 若要避免過量張貼攻擊，請啟用您要繫結的特定屬性。
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(TimeTblTable timeTblTable)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            int userid = Convert.ToInt32(Convert.ToString(Session["UserID"]));
            timeTblTable.UserID = userid;
            if (ModelState.IsValid)
            {
                db.Entry(timeTblTable).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ClassSubjectID = new SelectList(db.ClassSubjectTables.Where(s => s.IsActive == true), "ClassSubjectID", "Name", timeTblTable.ClassSubjectID);
            ViewBag.StaffID = new SelectList(db.StaffTables.Where(s => s.IsActive == true), "StaffID", "Name", timeTblTable.StaffID);
            ViewBag.UserID = new SelectList(db.UserTables, "UserID", "FullName", timeTblTable.UserID);
            return View(timeTblTable);
        }

        // GET: TimeTblTables/Delete/5
        public ActionResult Delete(int? id)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TimeTblTable timeTblTable = db.TimeTblTables.Find(id);
            if (timeTblTable == null)
            {
                return HttpNotFound();
            }
            return View(timeTblTable);
        }

        // POST: TimeTblTables/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            TimeTblTable timeTblTable = db.TimeTblTables.Find(id);
            db.TimeTblTables.Remove(timeTblTable);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
