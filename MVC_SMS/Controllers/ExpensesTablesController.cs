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
    public class ExpensesTablesController : Controller
    {
        private SchoolMgtDbEntities db = new SchoolMgtDbEntities();

        // GET: ExpensesTables
        public ActionResult Index()
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            var expensesTables = db.ExpensesTables.Include(e => e.ExpenseTypeTable).Include(e => e.UserTable);
            return View(expensesTables.ToList());
        }

        // GET: ExpensesTables/Details/5
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
            ExpensesTable expensesTable = db.ExpensesTables.Find(id);
            if (expensesTable == null)
            {
                return HttpNotFound();
            }
            return View(expensesTable);
        }

        // GET: ExpensesTables/Create
        public ActionResult Create()
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            ViewBag.ExpensesTypeID = new SelectList(db.ExpenseTypeTables, "ExpensesTypeID", "Name");
            ViewBag.UserID = new SelectList(db.UserTables, "UserID", "FullName");
            return View();
        }

        // POST: ExpensesTables/Create
        // 若要避免過量張貼攻擊，請啟用您要繫結的特定屬性。
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(ExpensesTable expensesTable)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            int userid = Convert.ToInt32(Convert.ToString(Session["UserID"]));
            expensesTable.UserID = userid;
            if (ModelState.IsValid)
            {
                db.ExpensesTables.Add(expensesTable);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            
            ViewBag.ExpensesTypeID = new SelectList(db.ExpenseTypeTables, "ExpensesTypeID", "Name", expensesTable.ExpensesTypeID);
            ViewBag.UserID = new SelectList(db.UserTables, "UserID", "FullName", expensesTable.UserID);
            return View(expensesTable);
        }

        // GET: ExpensesTables/Edit/5
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
            ExpensesTable expensesTable = db.ExpensesTables.Find(id);
            if (expensesTable == null)
            {
                return HttpNotFound();
            }
            ViewBag.ExpensesTypeID = new SelectList(db.ExpenseTypeTables, "ExpensesTypeID", "Name", expensesTable.ExpensesTypeID);
            ViewBag.UserID = new SelectList(db.UserTables, "UserID", "FullName", expensesTable.UserID);
            return View(expensesTable);
        }

        // POST: ExpensesTables/Edit/5
        // 若要避免過量張貼攻擊，請啟用您要繫結的特定屬性。
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(ExpensesTable expensesTable)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            int userid = Convert.ToInt32(Convert.ToString(Session["UserID"]));
            expensesTable.UserID = userid;
            if (ModelState.IsValid)
            {
                db.Entry(expensesTable).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            
            ViewBag.ExpensesTypeID = new SelectList(db.ExpenseTypeTables, "ExpensesTypeID", "Name", expensesTable.ExpensesTypeID);
            ViewBag.UserID = new SelectList(db.UserTables, "UserID", "FullName", expensesTable.UserID);
            return View(expensesTable);
        }

        // GET: ExpensesTables/Delete/5
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
            ExpensesTable expensesTable = db.ExpensesTables.Find(id);
            if (expensesTable == null)
            {
                return HttpNotFound();
            }
            return View(expensesTable);
        }

        // POST: ExpensesTables/Delete/5
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
            ExpensesTable expensesTable = db.ExpensesTables.Find(id);
            db.ExpensesTables.Remove(expensesTable);
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
