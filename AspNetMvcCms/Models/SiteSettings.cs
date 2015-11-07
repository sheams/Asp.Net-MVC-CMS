using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AspNetMvcCms.Models
{
    public class SiteSettings:BaseModel
    {
        public string SiteTitle { get; set; }
        public string SiteSlogan { get; set; }
        public string SiteDomain { get; set; }
        public string BannerImage { get; set; }
        public string SiteLogo { get; set; }
        public string Favicon { get; set; }
    }
}