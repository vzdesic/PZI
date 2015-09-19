using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using jQueryDemo.EFModel;

namespace jQueryDemo.Controllers
{
    public class PredavanjaController : Controller
    {
        private KonferencijaEntities db = new KonferencijaEntities();

        // GET: Predavanja
        public ActionResult Index()
        {
            return View(db.Predavanjas.ToList());
        }

        // GET: Predavanja/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Predavanja predavanja = db.Predavanjas.Find(id);
            if (predavanja == null)
            {
                return HttpNotFound();
            }
            return View(predavanja);
        }

        // GET: Predavanja/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Predavanja/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,PredavacID,Naslov,Opis,SmjerID,VrijemeOdrzavanja,DvoranaID,TipPredavanjaID,Trajanje")] Predavanja predavanja)
        {
            if (ModelState.IsValid)
            {
                db.Predavanjas.Add(predavanja);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(predavanja);
        }

        // GET: Predavanja/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Predavanja predavanja = db.Predavanjas.Find(id);
            if (predavanja == null)
            {
                return HttpNotFound();
            }
            return View(predavanja);
        }

        // POST: Predavanja/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,PredavacID,Naslov,Opis,SmjerID,VrijemeOdrzavanja,DvoranaID,TipPredavanjaID,Trajanje")] Predavanja predavanja)
        {
            if (ModelState.IsValid)
            {
                db.Entry(predavanja).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(predavanja);
        }

        // GET: Predavanja/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Predavanja predavanja = db.Predavanjas.Find(id);
            if (predavanja == null)
            {
                return HttpNotFound();
            }
            return View(predavanja);
        }

        // POST: Predavanja/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Predavanja predavanja = db.Predavanjas.Find(id);
            db.Predavanjas.Remove(predavanja);
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
