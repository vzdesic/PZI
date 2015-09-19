using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using RenderingViews.Models;
using Newtonsoft.Json;
using RenderingViews.Extensions;

namespace RenderingViews.Controllers
{
    public class KnjiznicaController : Controller
    {
        [MultipleResponseFormatsAttribute]
        public ActionResult Knjiga(long? id)
        {
            var db = new KnjiznicaEntities();

            db.Configuration.ProxyCreationEnabled = false;
            var knjiga = db.Knjiges.Find(id);
            knjiga = knjiga ?? db.Knjiges.FirstOrDefault();
            db.Configuration.ProxyCreationEnabled = true;

            return View("Knjiga", knjiga);
        }

        [MultipleResponseFormatsAttribute]
        public ActionResult Knjige()
        {
            var db = new KnjiznicaEntities();
            db.Configuration.ProxyCreationEnabled = false;
            var knjige = db.Knjiges;
            db.Configuration.ProxyCreationEnabled = true;
            return View("Knjige", knjige);
        }
    }
}