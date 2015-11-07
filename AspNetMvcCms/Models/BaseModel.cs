using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AspNetMvcCms.Models
{
    public class BaseModel
    {
        [Key]
        public long Id { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime ModificationDate { get; set; }
        public string CreateBy { get; set; }
        public string ModifyBy { get; set; }
        public int Status { get; set; }

    }
}