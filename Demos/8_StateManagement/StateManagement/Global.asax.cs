using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace StateManagement
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            Application["BrojPosjetitelja"] = 0;
        }

        protected void Session_Start()
        {
            Application["BrojPosjetitelja"] = ((int)Application["BrojPosjetitelja"]) + 1;
            Session["BrojPosjecenihStranicaTrenutnogKorisnika"] = 0;
        }

        protected void Request_Start()
        {
            Session["BrojPosjecenihStranicaTrenutnogKorisnika"] = ((int)Session["BrojPosjecenihStranicaTrenutnogKorisnika"]) + 1;
        }
    }
}
