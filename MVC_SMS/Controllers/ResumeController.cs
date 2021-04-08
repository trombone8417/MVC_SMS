using AutoMapper;
using AutoMapper.QueryableExtensions;
using DatabaseAccess;
using MVC_SMS.Models;
using MVC_SMS.Repository;
using MVC_SMS.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC_SMS.Controllers
{
    /// <summary>
    /// 履歷
    /// </summary>
    public class ResumeController : Controller
    {
        private readonly IResumeRepository _resumeRepository;
        public ResumeController(IResumeRepository resumeRepository)
        {
            _resumeRepository = resumeRepository;
        }

        // GET: Resume
        public ActionResult Index()
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            return View();
        }

        public ActionResult CheckCV(int? id)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            var employeeid = 0;
            if (id == null || id == 0)
            {
                int.TryParse(Convert.ToString(Session["EmployeeID"]), out employeeid);
            }
            else
            {
                employeeid = Convert.ToInt32(id);
                Session["EmployeeId"] = employeeid;
            }
           
            using (SchoolMgtDbEntities db = new SchoolMgtDbEntities())
            {
                var people = db.EmployeeResumeTables.Where(p => p.EmployeeID == employeeid);
                if (people != null)
                {
                    if (people.Count() > 0)
                    {
                        return RedirectToAction("CV", new { id = employeeid });
                    }
                    else
                    {
                        return RedirectToAction("PersonnalInformtion");
                    }
                }
                else
                {
                    return RedirectToAction("PersonnalInformtion");
                }
            }
        }

        public ActionResult ViewCV(int? id)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            return RedirectToAction("CV", new { id = id });
        }


        public ActionResult PersonnalInformtion()
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            return View();
        }


        [HttpGet]
        public ActionResult PersonnalInformtion(EmployeeResumeTableVM model)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            //Nationality
            List<SelectListItem> nationality = new List<SelectListItem>()
            {
                new SelectListItem { Text = "台灣", Value = "Taiwan", Selected = true},
            };
            model.DateOfBirth = DateTime.Now;

            //Educational Level
            List<SelectListItem> educationalLevel = new List<SelectListItem>()
            {
                new SelectListItem { Text = "碩士", Value = "碩士", Selected = true},
                new SelectListItem { Text = "大學", Value = "大學"},
                new SelectListItem { Text = "高中", Value = "高中"},
                new SelectListItem { Text = "國中", Value = "國中"},
                new SelectListItem { Text = "國小", Value = "國小"},
            };

            model.ListNationality = nationality;
            model.ListEducationalLevel = educationalLevel;

            return View(model);
        }

        [HttpPost]
        [ActionName("PersonnalInformtion")]
        public ActionResult AddPersonnalInformtion(EmployeeResumeTableVM employeeResumeTable)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            var employeeid = 0;
            int.TryParse(Convert.ToString(Session["EmployeeId"]), out employeeid);
            if (ModelState.IsValid)
            {
                AutoMapper.Mapper.Reset();
                //Creating Mapping
                Mapper.Initialize(cfg => cfg.CreateMap<EmployeeResumeTableVM, EmployeeResumeTable>());

                EmployeeResumeTable employeeResumeTableEntity = Mapper.Map<EmployeeResumeTable>(employeeResumeTable);
                employeeResumeTableEntity.EmployeeID = employeeid;
                HttpPostedFileBase file = Request.Files["ImageProfil"];

                bool result = _resumeRepository.AddPersonnalInformation(employeeResumeTableEntity, file);

                if (result)
                {
                    Session["EmployeeResumeID"] = _resumeRepository.GetIdPerson(employeeid);
                    return RedirectToAction("Education");
                }
                else
                {
                    ViewBag.Message = "Something Wrong !";
                    return View(employeeResumeTable);
                }

            }

            ViewBag.MessageForm = "Please Check your form before submit !";
            return View(employeeResumeTable);

        }

        [HttpGet]
        public ActionResult Education(EmployeeEducationTableVM education)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }

            return View();
        }

        [HttpPost]
        public ActionResult AddOrUpdateEducation(EmployeeEducationTableVM education)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            try
            {
                education.UserID = (int)Session["UserID"];
                education.EmployeeResumeID = (int)Session["EmployeeResumeID"];
                string msg = string.Empty;

                if (education != null)
                {
                    //Creating Mapping
                    Mapper.Reset();
                    Mapper.Initialize(cfg => cfg.CreateMap<EmployeeEducationTableVM, EmployeeEducationTable>());
                    EmployeeEducationTable educationEntity = Mapper.Map<EmployeeEducationTable>(education);

                    //int idPer = (int)Session["EmployeeResumeID"];

                    msg = _resumeRepository.AddOrUpdateEducation(educationEntity, education.EmployeeResumeID.GetValueOrDefault());

                }
                else
                {
                    msg = "Please re try the operation";
                }

                return Json(new { data = msg }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {

                return Json(new { data = "Undefined! please Try Again!" }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpGet]
        public PartialViewResult EducationPartial(EmployeeEducationTableVM education)
        {
            education.ListOfCountry = GetCountries();
            education.ListOfCity = new List<SelectListItem>();
            education.ListOfCity.Add(new SelectListItem() { Text = "台灣", Value = "台灣", Selected = true });
            education.ListOfCity.Add(new SelectListItem() { Text = "美國", Value = "美國" });
            education.ListOfCity.Add(new SelectListItem() { Text = "中國", Value = "中國" });
            education.ListOfCity.Add(new SelectListItem() { Text = "日本", Value = "日本" });

            return PartialView("~/Views/Shared/_MyEducation.cshtml", education);
        }

        [HttpGet]
        public ActionResult WorkExperience()
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            return View();
        }

        public PartialViewResult WorkExperiencePartial(EmployeeWorkExperienceTableVM workExperience)
        {
            workExperience.ListOfCountries = GetCountries();

            return PartialView("~/Views/Shared/_MyWorkExperience.cshtml", workExperience);
        }

        public ActionResult AddOrUpdateExperience(EmployeeWorkExperienceTableVM workExperience)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }

            string msg = string.Empty;
            workExperience.UserID = (int)Session["UserID"];
            if (workExperience != null)
            {
                //Creating Mapping
                Mapper.Reset();
                Mapper.Initialize(cfg => cfg.CreateMap<EmployeeWorkExperienceTableVM, EmployeeWorkExperienceTable>());
                EmployeeWorkExperienceTable workExperienceEntity = Mapper.Map<EmployeeWorkExperienceTable>(workExperience);

                int employeeResumeID = (int)Session["EmployeeResumeID"];


                msg = _resumeRepository.AddOrUpdateExperience(workExperienceEntity, employeeResumeID);

            }
            else
            {
                msg = "Please re try the operation";
            }

            return Json(new { data = msg }, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult SkiCerfLang()
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            return View();
        }

        public PartialViewResult SkillsPartial()
        {
            
            return PartialView("~/Views/Shared/_MySkills.cshtml");
        }

        public ActionResult AddSkill(EmployeeSkillTableVM skill)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            int employeeResumeID = (int)Session["EmployeeResumeID"];
            skill.UserID = (int)Session["UserID"];
            string msg = string.Empty;

            //Creating Mapping
            Mapper.Reset();
            Mapper.Initialize(cfg => cfg.CreateMap<EmployeeSkillTableVM, EmployeeSkillTable>());
            EmployeeSkillTable skillEntity = Mapper.Map<EmployeeSkillTable>(skill);

            if (_resumeRepository.AddSkill(skillEntity, employeeResumeID))
            {
                msg = "技能新增成功";
            }
            else
            {
                msg = "出現錯誤";
            }

            return Json(new { data = msg }, JsonRequestBehavior.AllowGet);
        }

        public PartialViewResult CertificationsPartial(EmployeeCertificationTableVM certification)
        {
            List<SelectListItem> certificationLevel = new List<SelectListItem>()
            {
                new SelectListItem { Text = "初級", Value = "初級", Selected = true},
                new SelectListItem { Text = "中級", Value = "中級"},
                new SelectListItem { Text = "高級", Value = "高級"}
            };

            certification.ListOfLevel = certificationLevel;

            return PartialView("~/Views/Shared/_MyCertifications.cshtml", certification);
        }

        public ActionResult AddCertification(EmployeeCertificationTableVM certification)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            int employeeResumeID = (int)Session["EmployeeResumeID"];
            certification.UserID = (int)Session["UserID"];
            string msg = string.Empty;

            //Creating Mapping
            Mapper.Reset();
            Mapper.Initialize(cfg => cfg.CreateMap<EmployeeCertificationTableVM, EmployeeCertificationTable>());
            EmployeeCertificationTable certificationEntity = Mapper.Map<EmployeeCertificationTable>(certification);

            if (_resumeRepository.AddCertification(certificationEntity, employeeResumeID))
            {
                msg = "證照新增成功";
            }
            else
            {
                msg = "出現錯誤";
            }

            return Json(new { data = msg }, JsonRequestBehavior.AllowGet);
        }

        public PartialViewResult LanguagePartial(EmployeeLanguageTableVM language)
        {
            List<SelectListItem> languageLevel = new List<SelectListItem>()
            {
                new SelectListItem { Text = "簡單", Value = "簡單", Selected = true},
                new SelectListItem { Text = "普通", Value = "普通"},
                new SelectListItem { Text = "流利", Value = "流利"},
            };

            language.ListOfProficiency = languageLevel;

            return PartialView("~/Views/Shared/_MyLanguage.cshtml", language);
        }

        public ActionResult AddLanguage(EmployeeLanguageTableVM language)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            int employeeResumeID = (int)Session["EmployeeResumeID"];
            language.UserID = (int)Session["UserID"];
            string msg = string.Empty;

            //Creating Mapping
            Mapper.Reset();
            Mapper.Initialize(cfg => cfg.CreateMap<EmployeeLanguageTableVM, EmployeeLanguageTable>());
            EmployeeLanguageTable languageEntity = Mapper.Map<EmployeeLanguageTable>(language);

            if (_resumeRepository.AddLanguage(languageEntity, employeeResumeID))
            {
                msg = "語言新增成功";
            }
            else
            {
                msg = "出現錯誤";
            }

            return Json(new { data = msg }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult CV(int? id)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            var employeeResumeID = 0;
            using (SchoolMgtDbEntities db = new SchoolMgtDbEntities())
            {
                var person = db.EmployeeResumeTables.Where(p => p.EmployeeID == id).FirstOrDefault();
                id = person.EmployeeID;
                employeeResumeID = person.EmployeeResumeID;
            }
            Session["EmployeeID"] = id;
            Session["EmployeeResumeID"] = employeeResumeID;
            return View();
        }

        public PartialViewResult GetPersonnalInfoPartial()
        {
            int idPer = (int)Session["EmployeeResumeID"];
            EmployeeResumeTable person = _resumeRepository.GetPersonnalInfo(idPer);

            //Creating Mapping
            Mapper.Reset();
            Mapper.Initialize(cfg => cfg.CreateMap<EmployeeResumeTable, EmployeeResumeTableVM>());
            EmployeeResumeTableVM personVM = Mapper.Map<EmployeeResumeTableVM>(person);

            return PartialView("~/Views/Shared/_MyPersonnalInfo.cshtml", personVM);
        }

        public PartialViewResult GetEducationCVPartial()
        {
            int idPer = (int)Session["EmployeeResumeID"];

            //Creating Mapping
            Mapper.Reset();
            Mapper.Initialize(cfg => cfg.CreateMap<EmployeeEducationTable, EmployeeEducationTableVM>());
            IQueryable<EmployeeEducationTableVM> educationList = _resumeRepository.GetEducationById(idPer).ProjectTo<EmployeeEducationTableVM>().AsQueryable();
            

            return PartialView("~/Views/Shared/_MyEducationCV.cshtml", educationList);
        }

        public PartialViewResult WorkExperienceCVPartial()
        {
            int idPer = (int)Session["EmployeeResumeID"];

            //Creating Mapping
            Mapper.Reset();
            Mapper.Initialize(cfg => cfg.CreateMap<EmployeeWorkExperienceTable, EmployeeWorkExperienceTableVM>());
            IQueryable<EmployeeWorkExperienceTableVM> workExperienceList = _resumeRepository.GetWorkExperienceById(idPer).ProjectTo<EmployeeWorkExperienceTableVM>().AsQueryable();


            return PartialView("~/Views/Shared/_WorkExperienceCV.cshtml", workExperienceList);
        }

        public PartialViewResult SkillsCVPartial()
        {
            int idPer = (int)Session["EmployeeResumeID"];

            //Creating Mapping
            Mapper.Reset();
            Mapper.Initialize(cfg => cfg.CreateMap<EmployeeSkillTable, EmployeeSkillTableVM>());
            IQueryable<EmployeeSkillTableVM> skillsList = _resumeRepository.GetSkillsById(idPer).ProjectTo<EmployeeSkillTableVM>().AsQueryable();


            return PartialView("~/Views/Shared/_MySkillsCV.cshtml", skillsList);
        }

        public PartialViewResult CertificationsCVPartial()
        {
            int idPer = (int)Session["EmployeeResumeID"];

            //Creating Mapping
            Mapper.Reset();
            Mapper.Initialize(cfg => cfg.CreateMap<EmployeeCertificationTable, EmployeeCertificationTableVM>());
            IQueryable<EmployeeCertificationTableVM> certificationList = _resumeRepository.GetCertificationsById(idPer).ProjectTo<EmployeeCertificationTableVM>().AsQueryable();


            return PartialView("~/Views/Shared/_MyCertificationCV.cshtml", certificationList);
        }

        public PartialViewResult LanguageCVPartial()
        {
            int idPer = (int)Session["EmployeeResumeID"];

            //Creating Mapping
            Mapper.Reset();
            Mapper.Initialize(cfg => cfg.CreateMap<EmployeeLanguageTable, EmployeeLanguageTableVM>());
            IQueryable<EmployeeLanguageTableVM> languageList = _resumeRepository.GetLanguageById(idPer).ProjectTo<EmployeeLanguageTableVM>().AsQueryable();


            return PartialView("~/Views/Shared/_MyLanguageCV.cshtml", languageList);
        }

        public ActionResult GetProfilImage(int id)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            byte[] image = _resumeRepository.GetPersonnalInfo(id).Profil;
            if (image != null)
            {
                return File(image, "image/png");
            }
            else
            {
                return null;
            }

        }

        public ActionResult GetCities(string country)
        {
            //若未登入
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                //導至登入頁
                return RedirectToAction("Login", "Home");
            }
            List<SelectListItem> listOfCities = new List<SelectListItem>();


            switch (country)
            {
                case "台灣":
                    listOfCities.Add(new SelectListItem() { Text = "台北", Value = "台北", Selected = true });
                    listOfCities.Add(new SelectListItem() { Text = "台中", Value = "台中" });
                    listOfCities.Add(new SelectListItem() { Text = "高雄", Value = "高雄" });
                    listOfCities.Add(new SelectListItem() { Text = "嘉義", Value = "嘉義" });
                    break;

                case "美國":
                    listOfCities.Add(new SelectListItem() { Text = "紐約", Value = "紐約", Selected = true });
                    listOfCities.Add(new SelectListItem() { Text = "洛杉磯", Value = "洛杉磯" });
                    listOfCities.Add(new SelectListItem() { Text = "芝加哥", Value = "芝加哥" });
                    break;

                case "中國":
                    listOfCities.Add(new SelectListItem() { Text = "北京", Value = "北京", Selected = true });
                    listOfCities.Add(new SelectListItem() { Text = "福建", Value = "福建" });
                    listOfCities.Add(new SelectListItem() { Text = "廣東", Value = "廣東" });
                    listOfCities.Add(new SelectListItem() { Text = "上海", Value = "上海" });
                    break;

                case "日本":
                    listOfCities.Add(new SelectListItem() { Text = "東京", Value = "東京", Selected = true });
                    listOfCities.Add(new SelectListItem() { Text = "大阪", Value = "大阪" });
                    break;
            }

            return Json(new { data = listOfCities }, JsonRequestBehavior.AllowGet);
        }

        public List<SelectListItem> GetCountries()
        {
            List<SelectListItem> listOfCountry = new List<SelectListItem>()
            {
            new SelectListItem() { Text = "台灣", Value = "台灣", Selected = true },
            new SelectListItem() { Text = "美國", Value = "美國" },
            new SelectListItem() { Text = "中國", Value = "中國" },
            new SelectListItem() { Text = "日本", Value = "日本" },
            };

            return listOfCountry;
        }

    }
}