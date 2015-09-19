using RoutingDemo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RoutingDemo.Controllers
{
    public class ArchiveController : Controller
    {
        //
        // GET: /Archive/

        public ActionResult Archive(DateTime? datum)
        {
            List<News> news = new List<News>();

            if (datum.HasValue)
            {
                news.Add(new News() { ID = 1, title = "Prva vijest", content = "Vijest prva ..." });
            }
            else {
                news.Add(new News() { ID = 1, title = "Prva vijest", content = "Vijest prva ..." });
                news.Add(new News() { ID = 2, title = "Druga vijest", content = "Vijest druga ..." });
            }

            return View("Archive", news);
        }

    }
}
