using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVC_SMS.Models
{
    public partial class Language
    {
        public int IDLang { get; set; }
        public string LanguageName { get; set; }
        public string Proficiency { get; set; }
        public Nullable<int> IdPers { get; set; }
        public virtual Person Person { get; set; }
    }
}