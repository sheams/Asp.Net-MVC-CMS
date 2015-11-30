using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using AspNetMvcCms.Models;
using Microsoft.AspNet.Identity;
using System.Text;

namespace AspNetMvcCms.Areas.Admin.Controllers
{
    public class PagesController : Controller
    {
        private ApplicationDbContext db = new ApplicationDbContext();

        // GET: Admin/Pages
        public ActionResult Index()
        {
            return View(db.Pages.ToList());
        }

        // GET: Admin/Pages/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Page page = db.Pages.Find(id);
            if (page == null)
            {
                return HttpNotFound();
            }
            return View(page);
        }

        // GET: Admin/Pages/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Pages/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "Id,Title,MetaKeyword,MetaDescription,ShortDescription,Body,Status")] Page page, string bodyText)
        {
            if (ModelState.IsValid)
            {
                var userId = User.Identity.GetUserId();
                page.CreateBy = userId;
                page.ModifyBy = userId;
                page.CreationDate = DateTime.Now;
                page.ModificationDate = DateTime.Now;
                var htmBody = Encoding.UTF8.GetBytes(bodyText);
                page.Body = htmBody;

                db.Pages.Add(page);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(page);
        }

        // GET: Admin/Pages/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Page page = db.Pages.Find(id);
            if (page == null)
            {
                return HttpNotFound();
            }
            var bodyText = Encoding.UTF8.GetString(page.Body);
            ViewBag.Text = bodyText;
            return View(page);
        }

        // POST: Admin/Pages/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "Id,Title,MetaKeyword,MetaDescription,ShortDescription,Body,Status")] Page page, string bodyText)
        {
            if (ModelState.IsValid)
            {
              var oldPage = db.Pages.Find(page.Id);

               if(oldPage != null)
                {
                    oldPage.Title = page.Title;
                    oldPage.MetaDescription = page.MetaDescription;
                    oldPage.MetaKeyword = page.MetaKeyword;
                    oldPage.ShortDescription = page.ShortDescription;
                    oldPage.Status = page.Status;
                    db.Entry(oldPage).State = EntityState.Modified;
                    var htmBody = Encoding.UTF8.GetBytes(bodyText);
                    oldPage.Body = htmBody;
                    db.SaveChanges();
                }
               else
                {
                    ViewBag.ErrorMessage = "Method Not Found";
                    return View(page);
                }
                return RedirectToAction("Index");
            }

            return View(page);
        }

        // GET: Admin/Pages/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Page page = db.Pages.Find(id);
            if (page == null)
            {
                return HttpNotFound();
            }
            return View(page);
        }

        // POST: Admin/Pages/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            Page page = db.Pages.Find(id);
            db.Pages.Remove(page);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
