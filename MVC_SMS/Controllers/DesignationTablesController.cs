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
    public class DesignationTablesController : Controller
    {
        private SchoolMgtDbEntities db = new SchoolMgtDbEntities();

        // GET: DesignationTables
        public ActionResult Index()
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            var designationTables = db.DesignationTables.Include(d => d.UserTable);
            return View(designationTables.ToList());
        }

        // GET: DesignationTables/Details/5
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
            DesignationTable designationTable = db.DesignationTables.Find(id);
            if (designationTable == null)
            {
                return HttpNotFound();
            }
            return View(designationTable);
        }

        // GET: DesignationTables/Create
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

        // POST: DesignationTables/Create
        // 若要避免過量張貼攻擊，請啟用您要繫結的特定屬性。
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(DesignationTable designationTable)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            int userid = Convert.ToInt32(Convert.ToString(Session["UserID"]));
            designationTable.UserID = userid;
            if (ModelState.IsValid)
            {
                db.DesignationTables.Add(designationTable);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.UserID = new SelectList(db.UserTables, "UserID", "FullName", designationTable.UserID);
            return View(designationTable);
        }

        // GET: DesignationTables/Edit/5
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
            DesignationTable designationTable = db.DesignationTables.Find(id);
            if (designationTable == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserID = new SelectList(db.UserTables, "UserID", "FullName", designationTable.UserID);
            return View(designationTable);
        }

        // POST: DesignationTables/Edit/5
        // 若要避免過量張貼攻擊，請啟用您要繫結的特定屬性。
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(DesignationTable designationTable)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            int userid = Convert.ToInt32(Convert.ToString(Session["UserID"]));
            designationTable.UserID = userid;
            if (ModelState.IsValid)
            {
                db.Entry(designationTable).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserID = new SelectList(db.UserTables, "UserID", "FullName", designationTable.UserID);
            return View(designationTable);
        }

        // GET: DesignationTables/Delete/5
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
            DesignationTable designationTable = db.DesignationTables.Find(id);
            if (designationTable == null)
            {
                return HttpNotFound();
            }
            return View(designationTable);
        }

        // POST: DesignationTables/Delete/5
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
            DesignationTable designationTable = db.DesignationTables.Find(id);
            db.DesignationTables.Remove(designationTable);
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
