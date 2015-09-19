using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace RoutingDemo
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            //Custom Route With Regular Expression Constraints for Dates:
            routes.MapRoute(
                name: "ArchiveRoute",
                url: "Archive/Archive/{entrydate}",
                defaults: new { Controller = "Archive", action = "Archive", entryDate = UrlParameter.Optional },
                constraints: new { entryDate = @"\d{2}-\d{2}-\d{4}" });

            // Default Route
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );

            //  //1. Modifying Route Default Options:
            //  routes.MapRoute(
            //    name: "Default",
            //    url: "{controller}/{action}",
            //    defaults: new { controller = "Home", action = "Contact"}
            //);

            // 2. List of all students, by default:
            // Browse following to test:
            //      - http://localhost:48676/studenti/          -> OK. Svi studenti se dobiju.
            //      - http://localhost:48676/studenti/1         -> ERROR. Pojasniti zašto.
            //      - http://localhost:48676/studenti/all/1     -> OK, jedan student se dobije.
            // Za ostale rute se primjenjuje default ruta.
            // Stavili smo i constraint! Id može biti samo broj!
            //      - http://localhost:48676/studenti/all/abc   -> KRIVO. Svi studenti se dobiju.
            routes.MapRoute(
                name: "Studenti",
                url: "Studenti/{action}/{id}",
                defaults: new
                {
                    controller = "Studenti",
                    action = "All",
                    id = UrlParameter.Optional
                },
                constraints: new {id = @"\d+"}
            );

            //Custom Route With HttpMethod Constraint
            routes.MapRoute(
                name: "HttpMethodConstraintRoute",
                url: "Studenti/Create",
                defaults: new { Controller = "Studenti", action = "Create" },
                constraints: new { method = new HttpMethodConstraint("POST") });

            routes.MapRoute(
                "ArticleRoute",
                "{article}/{controller}/{action}", 
                new { article="Unknown", controller = "News", action = "Index" });
            // You can access this custom article part of the route in your controller by accessing the RouteData object:
            // RouteData.Values["article"]
        }
    }
}