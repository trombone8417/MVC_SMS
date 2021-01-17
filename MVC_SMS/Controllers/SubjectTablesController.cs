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
    public class SubjectTablesController : Controller
    {
        private SchoolMgtDbEntities db = new SchoolMgtDbEntities();

        // GET: SubjectTables
        public ActionResult Index()
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            var subjectTables = db.SubjectTables.Include(s => s.UserTable);
            return View(subjectTables.ToList());
        }

        // GET: SubjectTables/Details/5
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
            SubjectTable subjectTable = db.SubjectTables.Find(id);
            if (subjectTable == null)
            {
                return HttpNotFound();
            }
            return View(subjectTable);
        }

        // GET: SubjectTables/Create
        public ActionResult Create()
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            ViewBag.UserID = new SelectList(db.UserTables, "UserID", "FullName");
            return View();
        }

        // POST: SubjectTables/Create
        // 若要避免過量張貼攻擊，請啟用您要繫結的特定屬性。
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(SubjectTable subjectTable)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }

            int userid = Convert.ToInt32(Convert.ToString(Session["UserID"]));
            subjectTable.UserID = userid;
            if (ModelState.IsValid)
            {
                db.SubjectTables.Add(subjectTable);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.UserID = new SelectList(db.UserTables, "UserID", "FullName", subjectTable.UserID);
            return View(subjectTable);
        }

        // GET: SubjectTables/Edit/5
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
            SubjectTable subjectTable = db.SubjectTables.Find(id);
            if (subjectTable == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserID = new SelectList(db.UserTables, "UserID", "FullName", subjectTable.UserID);
            return View(subjectTable);
        }

        // POST: SubjectTables/Edit/5
        // 若要避免過量張貼攻擊，請啟用您要繫結的特定屬性。
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(SubjectTable subjectTable)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }

            int userid = Convert.ToInt32(Convert.ToString(Session["UserID"]));
            subjectTable.UserID = userid;
            if (ModelState.IsValid)
            {
                db.Entry(subjectTable).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserID = new SelectList(db.UserTables, "UserID", "FullName", subjectTable.UserID);
            return View(subjectTable);
        }

        // GET: SubjectTables/Delete/5
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
            SubjectTable subjectTable = db.SubjectTables.Find(id);
            if (subjectTable == null)
            {
                return HttpNotFound();
            }
            return View(subjectTable);
        }

        // POST: SubjectTables/Delete/5
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
            SubjectTable subjectTable = db.SubjectTables.Find(id);
            db.SubjectTables.Remove(subjectTable);
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
