using AspNetMvcCms.App_Code;
using AspNetMvcCms.Areas.Admin.Models;
using AspNetMvcCms.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace AspNetMvcCms.Areas.Admin.Controllers
{
    [Authorize(Users="admin", Roles="Administrator")]
    public class SiteUserController : Controller
    {

        private UserManager<ApplicationUser> _userManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
        private RoleManager<IdentityRole> _roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(new ApplicationDbContext()));
        private ApplicationDbContext _db = new ApplicationDbContext();
        //
        // GET: /Admin/SiteUser/
        public ActionResult Index()
        {
            
            var users = _db.Users.ToList();
            List<SiteUserViewModel> userList = new List<SiteUserViewModel>();

            foreach (var user in users)
            {
                string roles ="";
                user.Roles.ToList().ForEach(x=> roles += x.Role.Name + ", " );

                userList.Add(new SiteUserViewModel()
                {
                    UserName = user.UserName,
                    Role = roles
                });
            }

            return View(userList);
        }

        //
        // GET: /Admin/SiteUser/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Admin/SiteUser/Create
        public ActionResult Create()
        {
            SetRoleDropdown();
            return View();
        }

        public void SetRoleDropdown()
        {
            var list = new Dictionary<string, string>();
            list.Add(SiteUserRoles.Administrator, SiteUserRoles.Administrator);
            list.Add(SiteUserRoles.Modaretor, SiteUserRoles.Modaretor);
            list.Add(SiteUserRoles.Editor, SiteUserRoles.Editor);
            list.Add(SiteUserRoles.Reader, SiteUserRoles.Reader);

            ViewBag.RoleList = new SelectList(list, "Key", "Value");
        }

        //
        // POST: /Admin/SiteUser/Create
        [HttpPost]
        public async Task<ActionResult> Create(SiteUserViewModel model)
        {
            string message="";
            SetRoleDropdown();
            try
            {
                if (ModelState.IsValid)
                {
                    var user = new ApplicationUser() { UserName = model.UserName };
                    var result = await _userManager.CreateAsync(user, model.Password);

                    if (result.Succeeded)
                    {
                        message += "User Create successful.<br/> ";
                        var r = _userManager.AddToRole(user.Id, model.Role);

                        if (r.Succeeded)
                        {
                            message += "Role added<br/> ";
                        }
                        else
                        {
                            message += "Role add failed <br/> ";
                            ViewBag.Message = message;
                            return View();
                        }                       
                    }
                    else
                    {
                        message += "User Create failed.<br/> ";
                        result.Errors.ToList().ForEach(x => message += x);
                        ViewBag.Message = message;
                        return View();
                    }

                    ViewBag.Message = message;
                    return View(new SiteUserViewModel());
                }
            }
            catch(Exception ex)
            {
                ViewBag.Message = "Error occured. "+ ex.Message;
                return View();
            }

            return View(model);
        }

        //
        // GET: /Admin/SiteUser/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Admin/SiteUser/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Admin/SiteUser/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Admin/SiteUser/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
