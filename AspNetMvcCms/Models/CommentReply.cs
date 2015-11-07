using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AspNetMvcCms.Models
{
    public class CommentReply:BaseModel
    {
        public string ReplyText { get; set; }
        public Comment Comment { get; set; }
    }
}