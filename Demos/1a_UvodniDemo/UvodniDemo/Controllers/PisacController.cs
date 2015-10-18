using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UvodniDemo.Models;

namespace UvodniDemo.Controllers
{
    public class PisacController : Controller
    {
        static List<Pisac> pisci = new List<Pisac>();

        private void NapuniPisce()
        {
            pisci.Add(new Pisac() { Id = 1, Ime = "Dobriša", Prezime = "Cesarić" });
            pisci.Add(new Pisac() { Id = 2, Ime = "Tin", Prezime = "Ujević" });
            pisci.Add(new Pisac() { Id = 3, Ime = "Jure", Prezime = "Kaštelan" });
        }
        // GET: Pisac
        public ActionResult Index()
        {
            if (pisci.Count == 0)
                NapuniPisce();

            return View(pisci);
        }

        // GET: Pisac/Details/5
        public ActionResult Details(int id)
        {
            Pisac pisac = pisci.FirstOrDefault(item => item.Id == id);

            return View(pisac);
        }

        // GET: Pisac/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Pisac/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
                int maxId = pisci.Max(item => item.Id);

                pisci.Add(new Pisac()
                {
                    Id = maxId + 1, Ime = collection["Ime"], Prezime = collection["Prezime"]
                });

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Pisac/Edit/5
        public ActionResult Edit(int id)
        {
            Pisac pisac = pisci.FirstOrDefault(item => item.Id == id);

            return View(pisac);
        }

        // POST: Pisac/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
                Pisac pisac = pisci.FirstOrDefault(item => item.Id == id);
                pisac.Id = id;
                pisac.Ime = collection["Ime"];
                pisac.Prezime = collection["Prezime"];

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Pisac/Delete/5
        public ActionResult Delete(int id)
        {
            Pisac pisac = pisci.FirstOrDefault(item => item.Id == id);

            return View(pisac);
        }

        // POST: Pisac/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
                foreach (var item in pisci)
                {
                    if (item.Id == id)
                    {
                        pisci.Remove(item);
                    }
                }

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
