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
    /// <summary>
    /// 班別
    /// </summary>
    public class SectionTablesController : Controller
    {
        private SchoolMgtDbEntities db = new SchoolMgtDbEntities();

        // GET: SectionTables
        public ActionResult Index()
        {
            var sectionTables = db.SectionTables.Include(s => s.UserTable);
            return View(sectionTables.ToList());
        }

        // GET: SectionTables/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SectionTable sectionTable = db.SectionTables.Find(id);
            if (sectionTable == null)
            {
                return HttpNotFound();
            }
            return View(sectionTable);
        }

        // GET: SectionTables/Create
        public ActionResult Create()
        {
            ViewBag.UserID = new SelectList(db.UserTables, "UserID", "FullName");
            return View();
        }

        // POST: SectionTables/Create
        // 若要避免過量張貼攻擊，請啟用您要繫結的特定屬性。
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(SectionTable sectionTable)
        {
            if (ModelState.IsValid)
            {
                db.SectionTables.Add(sectionTable);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.UserID = new SelectList(db.UserTables, "UserID", "FullName", sectionTable.UserID);
            return View(sectionTable);
        }

        // GET: SectionTables/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SectionTable sectionTable = db.SectionTables.Find(id);
            if (sectionTable == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserID = new SelectList(db.UserTables, "UserID", "FullName", sectionTable.UserID);
            return View(sectionTable);
        }

        // POST: SectionTables/Edit/5
        // 若要避免過量張貼攻擊，請啟用您要繫結的特定屬性。
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(SectionTable sectionTable)
        {
            if (ModelState.IsValid)
            {
                db.Entry(sectionTable).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserID = new SelectList(db.UserTables, "UserID", "FullName", sectionTable.UserID);
            return View(sectionTable);
        }

        // GET: SectionTables/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SectionTable sectionTable = db.SectionTables.Find(id);
            if (sectionTable == null)
            {
                return HttpNotFound();
            }
            return View(sectionTable);
        }

        // POST: SectionTables/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SectionTable sectionTable = db.SectionTables.Find(id);
            db.SectionTables.Remove(sectionTable);
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
