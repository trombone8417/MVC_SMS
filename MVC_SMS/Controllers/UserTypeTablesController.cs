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
    public class UserTypeTablesController : Controller
    {
        private SchoolMgtDbEntities db = new SchoolMgtDbEntities();

        // GET: UserTypeTables
        public ActionResult Index()
        {
            return View(db.UserTypeTables.ToList());
        }

        // GET: UserTypeTables/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserTypeTable userTypeTable = db.UserTypeTables.Find(id);
            if (userTypeTable == null)
            {
                return HttpNotFound();
            }
            return View(userTypeTable);
        }

        // GET: UserTypeTables/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: UserTypeTables/Create
        // 若要免於過量張貼攻擊，請啟用想要繫結的特定屬性，如需
        // 詳細資訊，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "UserTypeID,TypeName,Description")] UserTypeTable userTypeTable)
        {
            if (ModelState.IsValid)
            {
                db.UserTypeTables.Add(userTypeTable);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(userTypeTable);
        }

        // GET: UserTypeTables/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserTypeTable userTypeTable = db.UserTypeTables.Find(id);
            if (userTypeTable == null)
            {
                return HttpNotFound();
            }
            return View(userTypeTable);
        }

        // POST: UserTypeTables/Edit/5
        // 若要免於過量張貼攻擊，請啟用想要繫結的特定屬性，如需
        // 詳細資訊，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "UserTypeID,TypeName,Description")] UserTypeTable userTypeTable)
        {
            if (ModelState.IsValid)
            {
                db.Entry(userTypeTable).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(userTypeTable);
        }

        // GET: UserTypeTables/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserTypeTable userTypeTable = db.UserTypeTables.Find(id);
            if (userTypeTable == null)
            {
                return HttpNotFound();
            }
            return View(userTypeTable);
        }

        // POST: UserTypeTables/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            UserTypeTable userTypeTable = db.UserTypeTables.Find(id);
            db.UserTypeTables.Remove(userTypeTable);
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
