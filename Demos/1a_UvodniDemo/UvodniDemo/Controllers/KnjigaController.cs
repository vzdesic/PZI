using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UvodniDemo.Models;

namespace UvodniDemo.Controllers
{
    public class KnjigaController : Controller
    {
        static List<Knjiga> knjige = new List<Knjiga>();

        private void NapuniKnjige()
        {
            knjige.Add(new Knjiga()
            {
                Id = 1,
                Naslov = "Programiranje za Internet",
                Opis = "PZI predmet, literatura, ..."
            });
            knjige.Add(new Knjiga()
            {
                Id = 2,
                Naslov = "Harry Potter",
                Opis = "Knjiga o ..."
            });
            knjige.Add(new Knjiga()
            {
                Id = 3,
                Naslov = "Baze 1",
                Opis = "Obavezna literatura iz Baza 1"
            });
        }

        // GET: Knjiga
        public ActionResult Index()
        {           
            if(knjige.Count == 0)
                NapuniKnjige();

            return View(knjige);
        }

        // GET: Knjiga/Details/5
        public ActionResult Details(int id)
        {
            Knjiga knjiga = knjige.FirstOrDefault(item => item.Id == id);

            return View(knjiga);
        }

        // GET: Knjiga/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Knjiga/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
                knjige.Add(new Knjiga() { 
                    Id = 4, 
                    Naslov = collection["Naslov"], 
                    Opis = collection["Opis"]
                });

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Knjiga/Edit/5
        public ActionResult Edit(int id)
        {
            Knjiga knjiga = knjige.FirstOrDefault(item => item.Id == id);

            return View(knjiga);
        }

        // POST: Knjiga/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
                Knjiga knjiga = knjige.FirstOrDefault(item => item.Id == id);
                knjiga.Id = id;
                knjiga.Naslov = collection["Naslov"];
                knjiga.Opis = collection["Opis"];

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Knjiga/Delete/5
        public ActionResult Delete(int id)
        {
            Knjiga knjiga = knjige.FirstOrDefault(item => item.Id == id);

            return View(knjiga);
        }

        // POST: Knjiga/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
                foreach (var item in knjige)
                {
                    if (item.Id==id)
                    {
                        knjige.Remove(item);
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
