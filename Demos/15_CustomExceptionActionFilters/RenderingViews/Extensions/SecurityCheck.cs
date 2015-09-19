using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Filters;

namespace RenderingViews.Extensions
{
    public class SecurityCheckAttribute : ActionFilterAttribute, IAuthenticationFilter
    {
        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {

        }

        public void OnAuthentication(AuthenticationContext filterContext)
        {
            //In real life your custom principal might be retrieved via 
            //different source. i.e context/request etc.
            //We can also fill it from Session variable
            filterContext.Principal = filterContext.HttpContext.User;

            //TODO: Make some story around that.
        }

        public void OnAuthenticationChallenge(AuthenticationChallengeContext filterContext)
        {
            var identity = filterContext.HttpContext.Request.LogonUserIdentity;
            bool canExecute = (identity == null ? false : identity.IsAuthenticated);
            if (!canExecute)
                filterContext.Result = new HttpUnauthorizedResult();
        }
    }
}