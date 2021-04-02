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
    /// 學雜費
    /// </summary>
    public class AnnualTablesController : Controller
    {
        //連接資料庫
        private SchoolMgtDbEntities db = new SchoolMgtDbEntities();

        // GET: AnnualTables
        public ActionResult Index()
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            var annualTables = db.AnnualTables.Include(a => a.ProgrameTable).Include(a => a.UserTable).Where(p=>p.IsActive==true);
            return View(annualTables.ToList());
        }

        // GET: AnnualTables/Details/5
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
            AnnualTable annualTable = db.AnnualTables.Find(id);
            if (annualTable == null)
            {
                return HttpNotFound();
            }
            return View(annualTable);
        }

        // GET: AnnualTables/Create
        public ActionResult Create()
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            ViewBag.ProgrameID = new SelectList(db.ProgrameTables.Where(p=>p.IsActive==true), "ProgrameID", "Name");
            ViewBag.UserID = new SelectList(db.UserTables, "UserID", "FullName");
            return View();
        }

        // POST: AnnualTables/Create
        // 若要避免過量張貼攻擊，請啟用您要繫結的特定屬性。
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(AnnualTable annualTable)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            int userid = Convert.ToInt32(Convert.ToString(Session["UserID"]));
            annualTable.UserID = userid;
            if (ModelState.IsValid)
            {
                db.AnnualTables.Add(annualTable);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ProgrameID = new SelectList(db.ProgrameTables.Where(p => p.IsActive == true), "ProgrameID", "Name", annualTable.ProgrameID);
            ViewBag.UserID = new SelectList(db.UserTables, "UserID", "FullName", annualTable.UserID);
            return View(annualTable);
        }

        // GET: AnnualTables/Edit/5
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
            AnnualTable annualTable = db.AnnualTables.Find(id);
            if (annualTable == null)
            {
                return HttpNotFound();
            }
            ViewBag.ProgrameID = new SelectList(db.ProgrameTables.Where(p => p.IsActive == true), "ProgrameID", "Name", annualTable.ProgrameID);
            ViewBag.UserID = new SelectList(db.UserTables, "UserID", "FullName", annualTable.UserID);
            return View(annualTable);
        }

        // POST: AnnualTables/Edit/5
        // 若要避免過量張貼攻擊，請啟用您要繫結的特定屬性。
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(AnnualTable annualTable)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            int userid = Convert.ToInt32(Convert.ToString(Session["UserID"]));
            annualTable.UserID = userid;

            if (ModelState.IsValid)
            {
                db.Entry(annualTable).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ProgrameID = new SelectList(db.ProgrameTables.Where(p => p.IsActive == true), "ProgrameID", "Name", annualTable.ProgrameID);
            ViewBag.UserID = new SelectList(db.UserTables, "UserID", "FullName", annualTable.UserID);
            return View(annualTable);
        }

        // GET: AnnualTables/Delete/5
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
            AnnualTable annualTable = db.AnnualTables.Find(id);
            if (annualTable == null)
            {
                return HttpNotFound();
            }
            return View(annualTable);
        }

        // POST: AnnualTables/Delete/5
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
            AnnualTable annualTable = db.AnnualTables.Find(id);
            db.AnnualTables.Remove(annualTable);
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
