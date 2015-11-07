using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AspNetMvcCms.App_Code
{
    public class SiteUserRoles
    {
        public static string Administrator { get { return "Administrator"; } }
        public static string Modaretor { get { return "Modaretor"; } }
        public static string Editor { get { return "Editor"; } }
        public static string Reader { get { return "Reader"; } }
    }
}