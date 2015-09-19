using jQueryDemo.EFModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace jQueryDemo.Controllers
{
    public class PredavaciController : Controller
    {
        private KonferencijaEntities db = new KonferencijaEntities();

        // GET: Predavači
        public JsonResult Lista(string[] arr, bool someBool, int someInt, string someString, string id)
        {
            int ID = int.Parse(id.Split('_')[1]);

            return Json(db.Predavacis.Where(x => x.ID == ID).Select(x => new { Ime = x.Ime, Prezime = x.Prezime }).ToList(), JsonRequestBehavior.AllowGet);
        }
    }
}