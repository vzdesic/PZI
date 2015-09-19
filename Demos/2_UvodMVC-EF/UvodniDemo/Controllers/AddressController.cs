using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UvodniDemo.Models;

namespace UvodniDemo.Controllers
{
    [HandleError(View="CustomError")]
    public class AddressController : Controller
    {
        private AdventureWorksEntities db = new AdventureWorksEntities();

        //
        // GET: /Address/

        public ActionResult Index()
        {
            var addresses = db.Addresses.Include(a => a.StateProvince);
            return View(addresses.ToList());
        }

        //
        // GET: /Address/Details/5

        public ActionResult Details(int id = 0)
        {
            Address address = db.Addresses.Find(id);
            if (address == null)
            {
                return HttpNotFound();
            }
            return View(address);
        }

        //
        // GET: /Address/Create

        public ActionResult Create()
        {
            ViewBag.StateProvinceID = new SelectList(db.StateProvinces, "StateProvinceID", "StateProvinceCode");
            return View("Create");
        }

        //
        // POST: /Address/Create

        [HttpPost]
        public ActionResult Create(Address address)
        {
            if (ModelState.IsValid)
            {
                db.Addresses.Add(address);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.StateProvinceID = new SelectList(db.StateProvinces, "StateProvinceID", "StateProvinceCode", address.StateProvinceID);
            return View(address);
        }

        //
        // GET: /Address/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Address address = db.Addresses.Find(id);
            if (address == null)
            {
                return HttpNotFound();
            }
            ViewBag.StateProvinceID = new SelectList(db.StateProvinces, "StateProvinceID", "StateProvinceCode", address.StateProvinceID);
            return View(address);
        }

        //
        // POST: /Address/Edit/5

        [HttpPost]
        public ActionResult Edit(Address address)
        {
            if (ModelState.IsValid)
            {
                db.Entry(address).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.StateProvinceID = new SelectList(db.StateProvinces, "StateProvinceID", "StateProvinceCode", address.StateProvinceID);
            return View(address);
        }

        //
        // GET: /Address/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Address address = db.Addresses.Find(id);
            if (address == null)
            {
                return HttpNotFound();
            }
            return View(address);
        }

        //
        // POST: /Address/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Address address = db.Addresses.Find(id);
            db.Addresses.Remove(address);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }

        public ActionResult AllAddressAllProducts()
        {
            AllProductsAndAddresses all = new AllProductsAndAddresses();
            using (AdventureWorksEntities data = new AdventureWorksEntities())
            {
                all.products = data.Products.ToList();
                all.address = data.Addresses.ToList();
            }

            return View(all);
        }

        public ActionResult DataAnotationTest()
        {
            AddressModel model = new AddressModel();

            model.AddressLine1 = "adresa 1";
            model.AddressLine2 = "adresa 2";

            return View(model);
        }

        //[HttpPost]
        public ActionResult Save(AddressModel model)
        {
            //throw new Exception("test");
            
            if (ModelState.IsValid)
            {
                using (AdventureWorksEntities data = new AdventureWorksEntities())
                {
                    Address adresa = new Address();

                    adresa.AddressLine1 = model.AddressLine1;
                    adresa.AddressLine2 = model.AddressLine2;

                    //data.SaveChanges();
                }
            }
            return View();
        }

        public ActionResult ListByNumber(int houseNumber)
        {
            using (AdventureWorksEntities data = new AdventureWorksEntities())
            {
                string broj = houseNumber.ToString();
                var addresses = data.Addresses.Where(p => p.AddressLine1.Contains(broj)).ToList();

                return View(addresses);
            }
        }
    }
}