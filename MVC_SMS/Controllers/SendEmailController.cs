using MVC_SMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;

namespace MVC_SMS.Controllers
{
    public class SendEmailController : Controller
    {
        // GET: SendEmail
        public ActionResult SendEmail()
        {
            return View();
        }

        [HttpPost]
        public ActionResult SendEmail(MailModel _objModelMail)
        {
            //寄件者
            _objModelMail.From = "ttuttu834@gmail.com";
            if (ModelState.IsValid)
            {
                MailMessage mail = new MailMessage();
                mail.To.Add(_objModelMail.To);
                mail.From = new MailAddress(_objModelMail.From);
                mail.Subject = _objModelMail.Subject;
                string Body = _objModelMail.Body;
                mail.Body = Body;
                mail.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new System.Net.NetworkCredential("ttuttu834@gmail.com", "密碼"); // Enter seders User name and password  
                smtp.EnableSsl = true;
                //傳送Email
                smtp.Send(mail);
                //清空Data
                ModelState.Clear();
                ViewBag.messageSuccess = "Send Success";
                return View();
            }
            else
            {
                ViewBag.messageError = "Some Error";
                return View("SendEmail", _objModelMail);
            }
            
        }
    }
    
}