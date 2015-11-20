using AspNetMvcCms.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace AspNetMvcCms.Controllers
{
    public class PageController : Controller
    {
        ApplicationDbContext _db = new ApplicationDbContext();
        // GET: Page
        public ActionResult Index()
        {
            return View();
        }

        // GET: Page/Details/5
        public ActionResult Details(int id)
        {
            var page = _db.Pages.Find(id);

            if (page != null)
            {
                ViewBag.MetaDescription = page.MetaDescription;
                ViewBag.MetaKeyword = page.MetaKeyword;
                ViewBag.BodyText = Encoding.UTF8.GetString(page.Body);
            }
            return View(page);
        }

        // GET: Page/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Page/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Page/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Page/Edit/5
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

        // GET: Page/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Page/Delete/5
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
