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
    public class SubmissionFeeTablesController : Controller
    {
        private SchoolMgtDbEntities db = new SchoolMgtDbEntities();

        // GET: SubmissionFeeTables
        public ActionResult Index()
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            var submissionFeeTables = db.SubmissionFeeTables.Include(s => s.ProgrameTable).Include(s => s.StudentTable).Include(s => s.UserTable).Include(s => s.ClassTable).OrderByDescending(s=>s.SubmissionFeeID);
            return View(submissionFeeTables.ToList());
        }

        public ActionResult GetByPromotID(string sid)
        {
            int promoteid = Convert.ToInt32(sid);
            var promoterecord = db.StudentPromoteTables.Find(promoteid);

            return Json(new { StudentID = promoterecord.SectionID, ClassID = promoterecord.ClassID, ProgrameID = promoterecord.ProgrameSessionTable.ProgrameID }, JsonRequestBehavior.AllowGet);
        }

        // GET: SubmissionFeeTables/Details/5
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
            SubmissionFeeTable submissionFeeTable = db.SubmissionFeeTables.Find(id);
            if (submissionFeeTable == null)
            {
                return HttpNotFound();
            }
            return View(submissionFeeTable);
        }

        // GET: SubmissionFeeTables/Create
        public ActionResult Create()
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            ViewBag.ProgrameID = new SelectList(db.ProgrameTables, "ProgrameID", "Name");
            ViewBag.StudentID = new SelectList(db.StudentTables, "StudentID", "Name");
            ViewBag.UserID = new SelectList(db.UserTables, "UserID", "FullName");
            ViewBag.ClassID = new SelectList(db.ClassTables, "ClassID", "Name");
            return View();
        }

        // POST: SubmissionFeeTables/Create
        // 若要避免過量張貼攻擊，請啟用您要繫結的特定屬性。
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(SubmissionFeeTable submissionFeeTable)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            int userid = Convert.ToInt32(Convert.ToString(Session["UserID"]));
            submissionFeeTable.UserID = userid;
            if (ModelState.IsValid)
            {
                db.SubmissionFeeTables.Add(submissionFeeTable);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ProgrameID = new SelectList(db.ProgrameTables, "ProgrameID", "Name", submissionFeeTable.ProgrameID);
            ViewBag.StudentID = new SelectList(db.StudentTables, "StudentID", "Name", submissionFeeTable.StudentID);
            ViewBag.UserID = new SelectList(db.UserTables, "UserID", "FullName", submissionFeeTable.UserID);
            ViewBag.ClassID = new SelectList(db.ClassTables, "ClassID", "Name", submissionFeeTable.ClassID);
            return View(submissionFeeTable);
        }

        // GET: SubmissionFeeTables/Edit/5
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
            SubmissionFeeTable submissionFeeTable = db.SubmissionFeeTables.Find(id);
            if (submissionFeeTable == null)
            {
                return HttpNotFound();
            }
            ViewBag.ProgrameID = new SelectList(db.ProgrameTables, "ProgrameID", "Name", submissionFeeTable.ProgrameID);
            ViewBag.StudentID = new SelectList(db.StudentTables, "StudentID", "Name", submissionFeeTable.StudentID);
            ViewBag.UserID = new SelectList(db.UserTables, "UserID", "FullName", submissionFeeTable.UserID);
            ViewBag.ClassID = new SelectList(db.ClassTables, "ClassID", "Name", submissionFeeTable.ClassID);
            return View(submissionFeeTable);
        }

        // POST: SubmissionFeeTables/Edit/5
        // 若要避免過量張貼攻擊，請啟用您要繫結的特定屬性。
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(SubmissionFeeTable submissionFeeTable)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            int userid = Convert.ToInt32(Convert.ToString(Session["UserID"]));
            submissionFeeTable.UserID = userid;
            if (ModelState.IsValid)
            {
                db.Entry(submissionFeeTable).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ProgrameID = new SelectList(db.ProgrameTables, "ProgrameID", "Name", submissionFeeTable.ProgrameID);
            ViewBag.StudentID = new SelectList(db.StudentTables, "StudentID", "Name", submissionFeeTable.StudentID);
            ViewBag.UserID = new SelectList(db.UserTables, "UserID", "FullName", submissionFeeTable.UserID);
            ViewBag.ClassID = new SelectList(db.ClassTables, "ClassID", "Name", submissionFeeTable.ClassID);
            return View(submissionFeeTable);
        }

        // GET: SubmissionFeeTables/Delete/5
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
            SubmissionFeeTable submissionFeeTable = db.SubmissionFeeTables.Find(id);
            if (submissionFeeTable == null)
            {
                return HttpNotFound();
            }
            return View(submissionFeeTable);
        }

        // POST: SubmissionFeeTables/Delete/5
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
            SubmissionFeeTable submissionFeeTable = db.SubmissionFeeTables.Find(id);
            db.SubmissionFeeTables.Remove(submissionFeeTable);
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
