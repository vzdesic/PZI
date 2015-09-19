using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using RenderingViews.Models;
using Newtonsoft.Json;

namespace RenderingViews.Controllers
{
    public class AuctionsController : Controller
    {
        //View rendering:
        public ActionResult Auction(long? id)
        {
            var db = new KnjiznicaEntities();
            var auction = db.Knjiges.Find(id);
            if (auction == null)
            {
                auction = db.Knjiges.Find(4);
            }
            return View("Auction", auction);
            //View is returned with complete layout.
        }

        //View with Partial View rendering inside:
        public ActionResult KnjigePartial()
        {
            var db = new KnjiznicaEntities();
            var knjige = db.Knjiges;
            return View("Knjige", knjige);
            //View is returned with complete layout.
        }

        //View rendering:
        public ActionResult Knjige()
        {
            var db = new KnjiznicaEntities();
            var knjige = db.Knjiges;
            return View("Knjige", knjige);
            //View is returned with complete layout.
        }

        //[HttpPost]
        public ActionResult JsonKnjiga(long id)
        {
            var db = new KnjiznicaEntities();

            //If this is not done - db.Configuration.ProxyCreationEnabled = false;
            //than I got error:
            //    A circular reference was detected while serializing an 
            //    object of type System.Data.Entity
            //because entities are not serializable!
            db.Configuration.ProxyCreationEnabled = false;
            var knjiga = db.Knjiges.Find(id);
            db.Configuration.ProxyCreationEnabled = true;

            return Json(knjiga, JsonRequestBehavior.AllowGet);
            //You should never return data from a GET request that 
            //you would not want shared with the world. Than you have 
            //to use just:
            //return Json(auction);
        }
    }
}