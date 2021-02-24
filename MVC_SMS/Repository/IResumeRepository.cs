
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
        bool AddPersonnalInformation(EmployeeResumeTable person, HttpPostedFileBase file);
        string AddOrUpdateEducation(EmployeeEducationTable education, int EmployeeResumeID);
        int GetIdPerson(int EmployeeID);
        string AddOrUpdateExperience(EmployeeWorkExperienceTable workExperience, int EmployeeResumeID);
        bool AddSkill(EmployeeSkillTable skill, int EmployeeResumeID);
        bool AddCertification(EmployeeCertificationTable certification, int EmployeeResumeID);
        bool AddLanguage(EmployeeLanguageTable language, int EmployeeResumeID);
        EmployeeResumeTable GetPersonnalInfo(int EmployeeID);
        IQueryable<EmployeeEducationTable> GetEducationById(int EmployeeResumeID);
        IQueryable<EmployeeWorkExperienceTable> GetWorkExperienceById(int EmployeeResumeID);
        IQueryable<EmployeeSkillTable> GetSkillsById(int EmployeeResumeID);
        IQueryable<EmployeeCertificationTable> GetCertificationsById(int EmployeeResumeID);
        IQueryable<EmployeeLanguageTable> GetLanguageById(int EmployeeResumeID);


    }
}
