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
    public class StudentPromoteTablesController : Controller
    {
        private SchoolMgtDbEntities db = new SchoolMgtDbEntities();

        // GET: StudentPromoteTables
        public ActionResult Index()
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            var studentPromoteTables = db.StudentPromoteTables.Include(s => s.ClassTable).Include(s => s.ProgrameSessionTable).Include(s => s.StudentTable);
            return View(studentPromoteTables.ToList());
        }

        // GET: StudentPromoteTables/Details/5
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
            StudentPromoteTable studentPromoteTable = db.StudentPromoteTables.Find(id);
            if (studentPromoteTable == null)
            {
                return HttpNotFound();
            }
            return View(studentPromoteTable);
        }

        // GET: StudentPromoteTables/Create
        public ActionResult Create()
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            ViewBag.ClassID = new SelectList(db.ClassTables, "ClassID", "Name");
            ViewBag.ProgrameSessionID = new SelectList(db.ProgrameSessionTables, "ProgrameSessionID", "Details");
            ViewBag.StudentID = new SelectList(db.StudentTables, "StudentID", "Name");
            return View();
        }

        // POST: StudentPromoteTables/Create
        // 若要避免過量張貼攻擊，請啟用您要繫結的特定屬性。
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(StudentPromoteTable studentPromoteTable)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            if (ModelState.IsValid)
            {
                db.StudentPromoteTables.Add(studentPromoteTable);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ClassID = new SelectList(db.ClassTables, "ClassID", "Name", studentPromoteTable.ClassID);
            ViewBag.ProgrameSessionID = new SelectList(db.ProgrameSessionTables, "ProgrameSessionID", "Details", studentPromoteTable.ProgrameSessionID);
            ViewBag.StudentID = new SelectList(db.StudentTables, "StudentID", "Name", studentPromoteTable.StudentID);
            return View(studentPromoteTable);
        }

        // GET: StudentPromoteTables/Edit/5
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
            StudentPromoteTable studentPromoteTable = db.StudentPromoteTables.Find(id);
            if (studentPromoteTable == null)
            {
                return HttpNotFound();
            }
            ViewBag.ClassID = new SelectList(db.ClassTables, "ClassID", "Name", studentPromoteTable.ClassID);
            ViewBag.ProgrameSessionID = new SelectList(db.ProgrameSessionTables, "ProgrameSessionID", "Details", studentPromoteTable.ProgrameSessionID);
            ViewBag.StudentID = new SelectList(db.StudentTables, "StudentID", "Name", studentPromoteTable.StudentID);
            return View(studentPromoteTable);
        }

        // POST: StudentPromoteTables/Edit/5
        // 若要避免過量張貼攻擊，請啟用您要繫結的特定屬性。
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(StudentPromoteTable studentPromoteTable)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            if (ModelState.IsValid)
            {
                db.Entry(studentPromoteTable).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ClassID = new SelectList(db.ClassTables, "ClassID", "Name", studentPromoteTable.ClassID);
            ViewBag.ProgrameSessionID = new SelectList(db.ProgrameSessionTables, "ProgrameSessionID", "Details", studentPromoteTable.ProgrameSessionID);
            ViewBag.StudentID = new SelectList(db.StudentTables, "StudentID", "Name", studentPromoteTable.StudentID);
            return View(studentPromoteTable);
        }

        // GET: StudentPromoteTables/Delete/5
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
            StudentPromoteTable studentPromoteTable = db.StudentPromoteTables.Find(id);
            if (studentPromoteTable == null)
            {
                return HttpNotFound();
            }
            return View(studentPromoteTable);
        }

        // POST: StudentPromoteTables/Delete/5
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
            StudentPromoteTable studentPromoteTable = db.StudentPromoteTables.Find(id);
            db.StudentPromoteTables.Remove(studentPromoteTable);
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
