using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AspNetMvcCms.Models
{
    public class Menu : BaseModel
    {
        public string Name { get; set; }
        public string DisplayText { get; set; }
        public string Url { get; set; }
        public UrlAction ActionType { get; set; }
        public Menu Parent { get; set; }
        public List<Menu> Chields { get; set; }
        public Page Page { get; set; }
        public PageCategory PageCategory { get; set; }
        public int Order { get; set; }

    }

    public enum UrlAction
    {
        SameWindow,
        NewWindw,
    }
}