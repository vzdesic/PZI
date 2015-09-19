using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Filters;
using Microsoft.AspNet.Identity.EntityFramework;
using System.Security.Principal;

namespace RenderingViews.Extensions
{
    public class LoggingAfterExceptionAttribute : FilterAttribute, IExceptionFilter
    {
        public void OnException(ExceptionContext filterContext)
        {
            //This method gets invoked after all other filter have been executed and 
            //if an exception occurred during method execution.
            //Here you should place logic to handle the exception the way you need. 

            Exception current = filterContext.Exception;
            IIdentity identity = filterContext.HttpContext.User.Identity;

            //Save to log file ...
            string[] lines = { DateTime.Now.ToString() + "-------------------------", 
                               "\t\t\t\t\tUser : " + (identity.Name == "" ? "Anonymous" : identity.Name), 
                               "\t\t\t\t\tError: " + current.Message };
            // WriteAllLines creates a file, writes a collection of strings to the file, 
            // and then closes the file.

            System.IO.File.AppendAllLines(filterContext.HttpContext.Request.MapPath(@"~/Logs/" + "ApplicationLogFile.log"), lines);
        }
    }
}