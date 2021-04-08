using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DatabaseAccess;

namespace MVC_SMS.Controllers
{
    /// <summary>
    /// 教職員資料
    /// </summary>
    public class StaffTablesController : Controller
    {
        private SchoolMgtDbEntities db = new SchoolMgtDbEntities();

        // GET: StaffTables
        public ActionResult Index()
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            var staffTables = db.StaffTables.Include(s => s.DesignationTable).Include(s => s.UserTable);
            return View(staffTables.ToList());
        }

        // GET: StaffTables/Details/5
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
            StaffTable staffTable = db.StaffTables.Find(id);
            if (staffTable == null)
            {
                return HttpNotFound();
            }
            return View(staffTable);
        }

        // GET: StaffTables/Create
        public ActionResult Create()
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            ViewBag.DesignationID = new SelectList(db.DesignationTables, "DesignationID", "Title");
            ViewBag.UserID = new SelectList(db.UserTables, "UserID", "FullName");
            return View();
        }

        // POST: StaffTables/Create
        // 若要避免過量張貼攻擊，請啟用您要繫結的特定屬性。
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(StaffTable staffTable)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            int userid = Convert.ToInt32(Convert.ToString(Session["UserID"]));
            staffTable.UserID = userid;
            //預設圖片
            staffTable.Photo = "/Content/EmployeePhoto/default.png";
            if (ModelState.IsValid)
            {
                //先新增資料
                db.StaffTables.Add(staffTable);
                db.SaveChanges();
                if (staffTable.PhotoFile != null)
                {

                    var folder = "/Content/EmployeePhoto";
                    //新增之後才有staffTable.StaffID的資料
                    var file = string.Format("{0}.png", staffTable.StaffID);
                    var response = FileHelper.UploadFile.UploadPhoto(staffTable.PhotoFile, folder, file);
                    if (response)
                    {
                        //再修改圖片位置
                        var pic = string.Format("{0}/{1}", folder, file);
                        staffTable.Photo = pic;
                        db.Entry(staffTable).State = EntityState.Modified;
                        db.SaveChanges();
                    }
                }


                return RedirectToAction("Index");
            }

            ViewBag.DesignationID = new SelectList(db.DesignationTables, "DesignationID", "Title", staffTable.DesignationID);
            ViewBag.UserID = new SelectList(db.UserTables, "UserID", "FullName", staffTable.UserID);
            return View(staffTable);
        }

        // GET: StaffTables/Edit/5
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
            StaffTable staffTable = db.StaffTables.Find(id);
            if (staffTable == null)
            {
                return HttpNotFound();
            }
            ViewBag.DesignationID = new SelectList(db.DesignationTables, "DesignationID", "Title", staffTable.DesignationID);
            ViewBag.UserID = new SelectList(db.UserTables, "UserID", "FullName", staffTable.UserID);
            return View(staffTable);
        }

        // POST: StaffTables/Edit/5
        // 若要避免過量張貼攻擊，請啟用您要繫結的特定屬性。
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(StaffTable staffTable)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            int userid = Convert.ToInt32(Convert.ToString(Session["UserID"]));
            staffTable.UserID = userid;
            if (ModelState.IsValid)
            {
                if (staffTable.PhotoFile != null)
                {
                    var folder = "/Content/EmployeePhoto";
                    var file = string.Format("{0}.png", staffTable.StaffID);
                    var response = FileHelper.UploadFile.UploadPhoto(staffTable.PhotoFile, folder, file);
                    if (response)
                    {
                        var pic = string.Format("{0}/{1}", folder, file);
                        staffTable.Photo = pic;
                    }
                }

                db.Entry(staffTable).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.DesignationID = new SelectList(db.DesignationTables, "DesignationID", "Title", staffTable.DesignationID);
            ViewBag.UserID = new SelectList(db.UserTables, "UserID", "FullName", staffTable.UserID);
            return View(staffTable);
        }

        // GET: StaffTables/Delete/5
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
            StaffTable staffTable = db.StaffTables.Find(id);
            if (staffTable == null)
            {
                return HttpNotFound();
            }
            return View(staffTable);
        }

        // POST: StaffTables/Delete/5
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
            StaffTable staffTable = db.StaffTables.Find(id);
            db.StaffTables.Remove(staffTable);
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
