using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DataAnnotationDemo.Models;

namespace DataAnnotationDemo.Controllers
{
    public class HotelsController : Controller
    {
        private KonferencijaEntities db = new KonferencijaEntities();

        // GET: Hotels
        public ActionResult Index()
        {
            return View(db.Hotelis.ToList());
        }

        // GET: Hotels/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Hoteli hoteli = db.Hotelis.Find(id);
            if (hoteli == null)
            {
                return HttpNotFound();
            }
            return View(hoteli);
        }

        // GET: Hotels/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Hotels/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Naziv,Adresa,GradID")] Hoteli hoteli)
        {
            if (ModelState.IsValid)
            {
                db.Hotelis.Add(hoteli);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(hoteli);
        }

        // GET: Hotels/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Hoteli hoteli = db.Hotelis.Find(id);
            if (hoteli == null)
            {
                return HttpNotFound();
            }
            return View(hoteli);
        }

        // POST: Hotels/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Naziv,Adresa,GradID")] Hoteli hoteli)
        {
            if (ModelState.IsValid)
            {
                db.Entry(hoteli).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(hoteli);
        }

        // GET: Hotels/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Hoteli hoteli = db.Hotelis.Find(id);
            if (hoteli == null)
            {
                return HttpNotFound();
            }
            return View(hoteli);
        }

        // POST: Hotels/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Hoteli hoteli = db.Hotelis.Find(id);
            db.Hotelis.Remove(hoteli);
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
