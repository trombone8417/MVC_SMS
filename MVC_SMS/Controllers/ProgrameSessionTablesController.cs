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
    public class ProgrameSessionTablesController : Controller
    {
        private SchoolMgtDbEntities db = new SchoolMgtDbEntities();

        // GET: ProgrameSessionTables
        public ActionResult Index()
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            var programeSessionTables = db.ProgrameSessionTables.Include(p => p.ProgrameTable).Include(p => p.SessionTable).Include(p => p.UserTable);
            return View(programeSessionTables.ToList());
        }

        // GET: ProgrameSessionTables/Details/5
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
            ProgrameSessionTable programeSessionTable = db.ProgrameSessionTables.Find(id);
            if (programeSessionTable == null)
            {
                return HttpNotFound();
            }
            return View(programeSessionTable);
        }

        // GET: ProgrameSessionTables/Create
        public ActionResult Create()
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            ViewBag.ProgrameID = new SelectList(db.ProgrameTables, "ProgrameID", "Name");
            ViewBag.SessionID = new SelectList(db.SessionTables, "SessionID", "Name");
            ViewBag.UserID = new SelectList(db.UserTables, "UserID", "FullName");
            return View();
        }

        // POST: ProgrameSessionTables/Create
        // 若要避免過量張貼攻擊，請啟用您要繫結的特定屬性。
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(ProgrameSessionTable programeSessionTable)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }

            int userid = Convert.ToInt32(Convert.ToString(Session["UserID"]));
            programeSessionTable.UserID = userid;
            if (ModelState.IsValid)
            {
                var sessionName = db.SessionTables.Where(s => s.SessionID == programeSessionTable.SessionID).SingleOrDefault();
                var programeName = db.ProgrameTables.Where(s => s.ProgrameID == programeSessionTable.ProgrameID).SingleOrDefault();
                if (sessionName != null)
                {
                    if (!programeSessionTable.Details.Contains(sessionName.Name))
                    {
                        var details = "(" + sessionName.Name + "-" + (programeName != null ? programeName.Name : "") + ") " + programeSessionTable.Details;
                        programeSessionTable.Details = details;
                    }

                }
                db.ProgrameSessionTables.Add(programeSessionTable);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ProgrameID = new SelectList(db.ProgrameTables, "ProgrameID", "Name", programeSessionTable.ProgrameID);
            ViewBag.SessionID = new SelectList(db.SessionTables, "SessionID", "Name", programeSessionTable.SessionID);
            ViewBag.UserID = new SelectList(db.UserTables, "UserID", "FullName", programeSessionTable.UserID);
            return View(programeSessionTable);
        }

        // GET: ProgrameSessionTables/Edit/5
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
            ProgrameSessionTable programeSessionTable = db.ProgrameSessionTables.Find(id);
            if (programeSessionTable == null)
            {
                return HttpNotFound();
            }
            ViewBag.ProgrameID = new SelectList(db.ProgrameTables, "ProgrameID", "Name", programeSessionTable.ProgrameID);
            ViewBag.SessionID = new SelectList(db.SessionTables, "SessionID", "Name", programeSessionTable.SessionID);
            ViewBag.UserID = new SelectList(db.UserTables, "UserID", "FullName", programeSessionTable.UserID);
            return View(programeSessionTable);
        }

        // POST: ProgrameSessionTables/Edit/5
        // 若要避免過量張貼攻擊，請啟用您要繫結的特定屬性。
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(ProgrameSessionTable programeSessionTable)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            int userid = Convert.ToInt32(Convert.ToString(Session["UserID"]));
            programeSessionTable.UserID = userid;
            if (ModelState.IsValid)
            {
                var sessionName = db.SessionTables.Where(s => s.SessionID == programeSessionTable.SessionID).SingleOrDefault();
                var programeName = db.ProgrameTables.Where(s => s.ProgrameID == programeSessionTable.ProgrameID).SingleOrDefault();
                if (sessionName != null)
                {
                    if (!programeSessionTable.Details.Contains(sessionName.Name))
                    {
                        var details = "(" + sessionName.Name + "-" + (programeName != null ? programeName.Name : "") + ") " + programeSessionTable.Details;
                        programeSessionTable.Details = details;
                    }

                }
                db.Entry(programeSessionTable).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ProgrameID = new SelectList(db.ProgrameTables, "ProgrameID", "Name", programeSessionTable.ProgrameID);
            ViewBag.SessionID = new SelectList(db.SessionTables, "SessionID", "Name", programeSessionTable.SessionID);
            ViewBag.UserID = new SelectList(db.UserTables, "UserID", "FullName", programeSessionTable.UserID);
            return View(programeSessionTable);
        }

        // GET: ProgrameSessionTables/Delete/5
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
            ProgrameSessionTable programeSessionTable = db.ProgrameSessionTables.Find(id);
            if (programeSessionTable == null)
            {
                return HttpNotFound();
            }
            return View(programeSessionTable);
        }

        // POST: ProgrameSessionTables/Delete/5
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
            ProgrameSessionTable programeSessionTable = db.ProgrameSessionTables.Find(id);
            db.ProgrameSessionTables.Remove(programeSessionTable);
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
