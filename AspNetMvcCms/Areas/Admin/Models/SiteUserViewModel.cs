using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AspNetMvcCms.Areas.Admin.Models
{
    public class SiteUserViewModel
    {
        [Display(Name="User Name")]
        [Required]
        public string UserName { get; set; }
        [Display(Name = "Email Address")]
        [Required]
        public string Email { get; set; }
        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }
        [Compare("Password")]
        [DataType(DataType.Password)]
        public string ConfirmPassword { get; set; }
        [Display(Name="Select Role")]
        [Required]
        public string Role { get; set; }
    }
}