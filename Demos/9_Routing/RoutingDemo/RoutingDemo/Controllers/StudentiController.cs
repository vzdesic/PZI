using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using RoutingDemo.EntityFramework;

namespace RoutingDemo.Controllers
{
    public class StudentiController : Controller
    {
        private StudentiEntities db = new StudentiEntities();

        //
        // GET: /Studenti/

        public ActionResult Index()
        {
            return View(db.Studenti.ToList());
        }

        public ActionResult All(int? id)
        {
            if(id.HasValue)
            {
                return View("Index", db.Studenti.Where(p => p.ID == id).ToList());
            }

            return View("Index", db.Studenti.ToList());
        }

        public ActionResult Archive(DateTime? datum)
        {
            if (!datum.HasValue)
            {
                return View("Archive", DateTime.Now);
            }

            return View("Index", db.Studenti.ToList());
        }

        //
        // GET: /Studenti/Details/5

        public ActionResult Details(int id = 0)
        {
            Studenti studenti = db.Studenti.Find(id);
            if (studenti == null)
            {
                return HttpNotFound();
            }
            return View(studenti);
        }

        //
        // GET: /Studenti/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Studenti/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Studenti studenti)
        {
            if (ModelState.IsValid)
            {
                db.Studenti.Add(studenti);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(studenti);
        }

        //
        // GET: /Studenti/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Studenti studenti = db.Studenti.Find(id);
            if (studenti == null)
            {
                return HttpNotFound();
            }
            return View(studenti);
        }

        //
        // POST: /Studenti/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Studenti studenti)
        {
            if (ModelState.IsValid)
            {
                db.Entry(studenti).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(studenti);
        }

        //
        // GET: /Studenti/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Studenti studenti = db.Studenti.Find(id);
            if (studenti == null)
            {
                return HttpNotFound();
            }
            return View(studenti);
        }

        //
        // POST: /Studenti/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Studenti studenti = db.Studenti.Find(id);
            db.Studenti.Remove(studenti);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}