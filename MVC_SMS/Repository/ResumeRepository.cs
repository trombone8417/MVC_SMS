﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MVC_SMS.Models;
using System.IO;
using System.Data.Entity.Validation;
using System.Data.Entity;
using AutoMapper.QueryableExtensions;
using MVC_SMS.ViewModels;
using MVC_SMS.Repository;
using DatabaseAccess;

namespace RecruitmentSystemMgt.Repository
{
    public class ResumeRepository : IResumeRepository
    {
        //Db Context
        private readonly SchoolMgtDbEntities _dbContext = new SchoolMgtDbEntities();

        public bool AddCertification(EmployeeCertificationTable certification, int EmployeeResumeID)
        {
            try
            {
                int countRecords = 0;
                EmployeeResumeTable personEntity = _dbContext.EmployeeResumeTables.Where(Emp => Emp.EmployeeResumeID == EmployeeResumeID).FirstOrDefault() ;

                if (personEntity != null && certification != null)
                {
                    personEntity.EmployeeCertificationTables.Add(certification);
                    countRecords = _dbContext.SaveChanges();
                }

                return countRecords > 0 ? true : false;
            }
            catch (DbEntityValidationException dbEx)
            {

                throw;
            }

        }

        public bool AddLanguage(EmployeeLanguageTable language, int EmployeeResumeID)
        {
            int countRecords = 0;
            EmployeeResumeTable personEntity = _dbContext.EmployeeResumeTables.Where(Emp => Emp.EmployeeResumeID == EmployeeResumeID).FirstOrDefault();

            if (personEntity != null && language != null)
            {
                personEntity.EmployeeLanguageTables.Add(language);
                countRecords = _dbContext.SaveChanges();
            }

            return countRecords > 0 ? true : false;
        }

        public string AddOrUpdateEducation(EmployeeEducationTable education, int EmployeeResumeID)
        {
            string msg = string.Empty;

            EmployeeResumeTable personEntity = _dbContext.EmployeeResumeTables.Where(Emp => Emp.EmployeeResumeID == EmployeeResumeID).FirstOrDefault();

            if (personEntity != null)
            {
                if (education.EmployeeEducationID > 0)
                {
                    //we will update education entity
                    _dbContext.Entry(education).State = EntityState.Modified;
                    _dbContext.SaveChanges();

                    msg = "Education entity has been updated successfully";
                }
                else
                {
                    // we will add new education entity
                    personEntity.EmployeeEducationTables.Add(education);
                    _dbContext.SaveChanges();

                    msg = "Education entity has been Added successfully";
                }
            }

            return msg;
        }

        public string AddOrUpdateExperience(EmployeeWorkExperienceTable workExperience, int EmployeeResumeID)
        {
            string msg = string.Empty;

            EmployeeResumeTable personEntity = _dbContext.EmployeeResumeTables.Where(Emp => Emp.EmployeeResumeID == EmployeeResumeID).FirstOrDefault();

            if (personEntity != null)
            {
                if (workExperience.EmployeeWorkExperienceID > 0)
                {
                    //we will update work experience entity
                    _dbContext.Entry(workExperience).State = EntityState.Modified;
                    _dbContext.SaveChanges();

                    msg = "Work Experience entity has been updated successfully";
                }
                else
                {
                    // we will add new work experience entity
                    personEntity.EmployeeWorkExperienceTables.Add(workExperience);
                    _dbContext.SaveChanges();

                    msg = "Work Experience entity has been Added successfully";
                }
            }

            return msg;
        }

        public bool AddPersonnalInformation(EmployeeResumeTable person, HttpPostedFileBase file)
        {
            try
            {
                int nbRecords = 0;

                if (person != null)
                {
                    if (file != null)
                    {
                        person.Profil = ConvertToBytes(file);
                    }

                    _dbContext.EmployeeResumeTables.Add(person);
                    nbRecords = _dbContext.SaveChanges();
                }

                return nbRecords > 0 ? true : false;
            }
            catch (DbEntityValidationException dbEx)
            {

                Exception raise = dbEx;
                foreach (var validationErrors in dbEx.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        string message = string.Format("{0}:{1}",
                            validationErrors.Entry.Entity.ToString(),
                            validationError.ErrorMessage);
                        // raise a new exception nesting
                        // the current instance as InnerException
                        raise = new InvalidOperationException(message, raise);
                    }
                }
                throw raise;
            }

        }

        public bool AddSkill(EmployeeSkillTable skill, int EmployeeResumeID)
        {
            int countRecords = 0;
            EmployeeResumeTable personEntity = _dbContext.EmployeeResumeTables.Where(Emp => Emp.EmployeeResumeID == EmployeeResumeID).FirstOrDefault();

            if (personEntity != null && skill != null)
            {
                personEntity.EmployeeSkillTables.Add(skill);
                countRecords = _dbContext.SaveChanges();
            }

            return countRecords > 0 ? true : false;

        }

        public IQueryable<EmployeeCertificationTable> GetCertificationsById(int EmployeeResumeID)
        {
            var certificationList = _dbContext.EmployeeCertificationTables.Where(w => w.EmployeeResumeID == EmployeeResumeID);
            return certificationList;
        }

        public IQueryable<EmployeeEducationTable> GetEducationById(int EmployeeResumeID)
        {
            var educationList = _dbContext.EmployeeEducationTables.Where(e => e.EmployeeResumeID == EmployeeResumeID);
            return educationList;
        }

        public int GetIdPerson(string firstName, string lastName)
        {
            int idSelected = _dbContext.EmployeeResumeTables.Where(p => p.FirstName.ToLower().Equals(firstName.ToLower()))
                                              .Where(p => p.LastName.ToLower().Equals(lastName.ToLower()))
                                              .Select(p => p.EmployeeResumeID).FirstOrDefault();

            return idSelected;
        }

        public IQueryable<EmployeeLanguageTable> GetLanguageById(int EmployeeResumeID)
        {
            var languageList = _dbContext.EmployeeLanguageTables.Where(w => w.EmployeeResumeID == EmployeeResumeID);
            return languageList;
        }

        public EmployeeResumeTable GetPersonnalInfo(int EmployeeResumeID)
        {
            return _dbContext.EmployeeResumeTables.Find(EmployeeResumeID);
        }

        public IQueryable<EmployeeSkillTable> GetSkillsById(int EmployeeResumeID)
        {
            var skillsList = _dbContext.EmployeeSkillTables.Where(w => w.EmployeeResumeID == EmployeeResumeID);
            return skillsList;
        }

        public IQueryable<EmployeeWorkExperienceTable> GetWorkExperienceById(int EmployeeResumeID)
        {
            var workExperienceList = _dbContext.EmployeeWorkExperienceTables.Where(w => w.EmployeeResumeID == EmployeeResumeID);
            return workExperienceList;
        }

        private byte[] ConvertToBytes(HttpPostedFileBase image)
        {
            byte[] imageBytes = null;
            BinaryReader reader = new BinaryReader(image.InputStream);
            imageBytes = reader.ReadBytes((int)image.ContentLength);
            return imageBytes;
        }

    }

}
 