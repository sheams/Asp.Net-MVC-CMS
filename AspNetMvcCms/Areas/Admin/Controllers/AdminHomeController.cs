using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AspNetMvcCms.Areas.Admin.Controllers
{
    [Authorize(Roles="Administrator,Modaretor,Editor")]
    public class AdminHomeController : Controller
    {
        //
        // GET: /Admin/AdminHome/
        public ActionResult Index()
        {
            return View();
        }


	}
}