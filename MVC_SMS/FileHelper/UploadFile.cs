using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace MVC_SMS.FileHelper
{
    /// <summary>
    /// 上傳圖片
    /// </summary>
    public class UploadFile
    {
        /// <summary>
        /// 上傳圖片
        /// </summary>
        /// <param name="file">圖片</param>
        /// <param name="folder">文件夾位置</param>
        /// <param name="name">名稱</param>
        /// <returns></returns>
        public static bool UploadPhoto(HttpPostedFileBase file, string folder, string name)
        {
            if (file == null || string.IsNullOrEmpty(name) || string.IsNullOrEmpty(folder))
            {
                return false;
            }
            try
            {
                //檔案位置
                string path = string.Empty;
                if (file != null)
                {
                    //檔案位置=文件夾位置/圖片檔名
                    path = Path.Combine(HttpContext.Current.Server.MapPath(folder), name);
                    file.SaveAs(path);
                    using (MemoryStream ms = new MemoryStream())
                    {
                        file.InputStream.CopyTo(ms);
                        byte[] array = ms.GetBuffer();
                    }
                }
                return true;
            }
            catch (Exception)
            {

                return false;
            }
        }

    }
}