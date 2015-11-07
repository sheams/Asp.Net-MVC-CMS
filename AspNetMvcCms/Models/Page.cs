using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AspNetMvcCms.Models
{
    public class Page:BaseModel
    {
        public string Title { get; set; }
        public string MetaKeyword { get; set; }
        public string MetaDescription { get; set; }
        public string ShortDescription { get; set; }
        public byte[] Body { get; set; }
        public List<Comment> Comments { get; set; }
    }
}