
using DatabaseAccess;
using MVC_SMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace MVC_SMS.Repository
{
    public interface IResumeRepository
    {
        /// <summary>
        /// 個人資訊
        /// </summary>
        /// <param name="person"></param>
        /// <param name="file"></param>
        /// <returns></returns>
        bool AddPersonnalInformation(EmployeeResumeTable person, HttpPostedFileBase file);
        /// <summary>
        /// 教育程度(新增或更新)
        /// </summary>
        /// <param name="education"></param>
        /// <param name="EmployeeResumeID"></param>
        /// <returns></returns>
        string AddOrUpdateEducation(EmployeeEducationTable education, int EmployeeResumeID);
        /// <summary>
        /// 使用者ID
        /// </summary>
        /// <param name="EmployeeID"></param>
        /// <returns></returns>
        int GetIdPerson(int EmployeeID);
        /// <summary>
        /// 工作經驗
        /// </summary>
        /// <param name="workExperience"></param>
        /// <param name="EmployeeResumeID"></param>
        /// <returns></returns>
        string AddOrUpdateExperience(EmployeeWorkExperienceTable workExperience, int EmployeeResumeID);
        /// <summary>
        /// 技能
        /// </summary>
        /// <param name="skill"></param>
        /// <param name="EmployeeResumeID"></param>
        /// <returns></returns>
        bool AddSkill(EmployeeSkillTable skill, int EmployeeResumeID);
        /// <summary>
        /// 證照
        /// </summary>
        /// <param name="certification"></param>
        /// <param name="EmployeeResumeID"></param>
        /// <returns></returns>
        bool AddCertification(EmployeeCertificationTable certification, int EmployeeResumeID);
        /// <summary>
        /// 語言
        /// </summary>
        /// <param name="language"></param>
        /// <param name="EmployeeResumeID"></param>
        /// <returns></returns>
        bool AddLanguage(EmployeeLanguageTable language, int EmployeeResumeID);
        /// <summary>
        /// 撈出使用者資訊
        /// </summary>
        /// <param name="EmployeeID"></param>
        /// <returns></returns>
        EmployeeResumeTable GetPersonnalInfo(int EmployeeID);
        /// <summary>
        /// 撈出使用者教育程度
        /// </summary>
        /// <param name="EmployeeResumeID"></param>
        /// <returns></returns>
        IQueryable<EmployeeEducationTable> GetEducationById(int EmployeeResumeID);
        /// <summary>
        /// 撈出使用者工作經驗
        /// </summary>
        /// <param name="EmployeeResumeID"></param>
        /// <returns></returns>
        IQueryable<EmployeeWorkExperienceTable> GetWorkExperienceById(int EmployeeResumeID);
        /// <summary>
        /// 撈出使用者工作技能
        /// </summary>
        /// <param name="EmployeeResumeID"></param>
        /// <returns></returns>
        IQueryable<EmployeeSkillTable> GetSkillsById(int EmployeeResumeID);
        /// <summary>
        /// 撈出使用者工作證照
        /// </summary>
        /// <param name="EmployeeResumeID"></param>
        /// <returns></returns>
        IQueryable<EmployeeCertificationTable> GetCertificationsById(int EmployeeResumeID);
        /// <summary>
        /// 撈出使用者語言
        /// </summary>
        /// <param name="EmployeeResumeID"></param>
        /// <returns></returns>
        IQueryable<EmployeeLanguageTable> GetLanguageById(int EmployeeResumeID);


    }
}
