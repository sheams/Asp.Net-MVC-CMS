using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AspNetMvcCms.Models
{
    public class Comment:BaseModel
    {
        public string CommentText { get; set; }
        public Page Page { get; set; }
        public List<CommentReply> Reply { get; set; }
    }
}