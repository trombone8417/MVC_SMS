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
            var studentPromoteTables = db.StudentPromoteTables.Include(s => s.ClassTable).Include(s => s.ProgrameSessionTable).Include(s => s.SectionTable).Include(s => s.StudentTable).OrderByDescending(s => s.StudentPromoteID);
            return View(studentPromoteTables.ToList());
        }

        public ActionResult GetPromotClsList(string sid)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            int studentid = Convert.ToInt32(sid);
            var student = db.StudentTables.Find(studentid);
            var promotelist = db.StudentPromoteTables.Where(p => p.StudentID == studentid);//
            var promoteid=-1;
            if (promotelist.Any())
            {
                promoteid = promotelist.Max(m => m.StudentPromoteID);
            }
            else
            {
                promoteid = 0;
            }
            List<ClassTable> classTable = new List<ClassTable>();
            if (promoteid > 0)
            {
                var promotetable = db.StudentPromoteTables.Find(promoteid);
                foreach (var cls in db.ClassTables.Where(cls => cls.ClassID > promotetable.ClassID))
                {
                    classTable.Add(new ClassTable { ClassID = cls.ClassID, Name = cls.Name });
                }
            }
            else
            {
                foreach (var cls in db.ClassTables.Where(cls => cls.ClassID > student.ClassID))
                {
                    classTable.Add(new ClassTable { ClassID = cls.ClassID, Name = cls.Name });
                }
            }

            return Json(new { data = classTable }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetAnnualFee(string sid)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            int progsessid = Convert.ToInt32(sid);
            var ps = db.ProgrameSessionTables.Find(progsessid);
            var annualfee = db.AnnualTables.Where(a => a.AnnualID == ps.ProgrameID).SingleOrDefault();
            double? fee = annualfee.Fees;
            return Json(new { fees = fee }, JsonRequestBehavior.AllowGet);
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
            ViewBag.SectionID = new SelectList(db.SectionTables, "SectionID", "SectionName");
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
            ViewBag.SectionID = new SelectList(db.SectionTables, "SectionID", "SectionName", studentPromoteTable.SectionID);
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
            ViewBag.SectionID = new SelectList(db.SectionTables, "SectionID", "SectionName", studentPromoteTable.SectionID);
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
            ViewBag.SectionID = new SelectList(db.SectionTables, "SectionID", "SectionName", studentPromoteTable.SectionID);
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
