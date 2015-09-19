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
    public class PolaznicisController : Controller
    {
        private KonferencijaEntities db = new KonferencijaEntities();

        // GET: Polaznicis
        public ActionResult Index()
        {
            return View(db.Polaznicis.ToList());
        }

        // GET: Polaznicis/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Polaznici polaznici = db.Polaznicis.Find(id);
            if (polaznici == null)
            {
                return HttpNotFound();
            }
            return View(polaznici);
        }

        // GET: Polaznicis/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Polaznicis/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Ime,Prezime,DatumRodenja,OIB,Adresa,GradID,Spol")] Polaznici polaznici)
        {
            if (ModelState.IsValid)
            {
                db.Polaznicis.Add(polaznici);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(polaznici);
        }

        // GET: Polaznicis/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Polaznici polaznici = db.Polaznicis.Find(id);
            if (polaznici == null)
            {
                return HttpNotFound();
            }
            return View(polaznici);
        }

        // POST: Polaznicis/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Ime,Prezime,DatumRodenja,OIB,Adresa,GradID,Spol")] Polaznici polaznici)
        {
            if (ModelState.IsValid)
            {
                db.Entry(polaznici).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(polaznici);
        }

        // GET: Polaznicis/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Polaznici polaznici = db.Polaznicis.Find(id);
            if (polaznici == null)
            {
                return HttpNotFound();
            }
            return View(polaznici);
        }

        // POST: Polaznicis/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Polaznici polaznici = db.Polaznicis.Find(id);
            db.Polaznicis.Remove(polaznici);
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
