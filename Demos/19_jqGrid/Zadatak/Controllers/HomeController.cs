using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using System.Xml;
using System.Xml.Linq;
using Zadatak.Helpers;
using Zadatak.Models;

namespace Zadatak.Controllers {
    public class HomeController : Controller {
        public ActionResult Index() {
            ViewBag.Message = "Modify this template to jump-start your ASP.NET MVC application.";

            return View();
        }

        public ActionResult About() {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        public ActionResult Contact() {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        [HttpPost]
        public ActionResult LoadImenikData(string sidx, string sord, int page, int rows, bool _search, string searchField, string searchOper, string searchString) {
            // Get the data
            if (Session["CsvData"] == null) {
                string path = ConfigurationManager.AppSettings["csvpath"].ToString();
                Session["CsvData"] = Helper.GetListFromCsv(path);
            }
            var poeple = ((List<Person>)Session["CsvData"]).AsQueryable();

            // If search, filter the list against the search condition.
            // Only "contains" search is implemented here.
            var filteredPoeple = poeple;
            if (_search) {
                filteredPoeple = poeple.Where(s =>
                    (typeof(Person).GetProperty(searchField).GetValue(s, null) == null) ? false :
                        typeof(Person).GetProperty(searchField).GetValue(s, null)
                        .ToString().Contains(searchString));
            }

            // Sort the student list
            var sortedPoeple = Helper.SortIQueryable<Person>(filteredPoeple, sidx, sord);

            // Calculate the total number of pages
            var totalRecords = filteredPoeple.Count();
            var totalPages = (int)Math.Ceiling((double)totalRecords / (double)rows);

            // Prepare the data to fit the requirement of jQGrid
            var data = (from s in poeple
                        select new {
                            id = s.Phone,
                            cell = new object[] { s.Name, s.Surname, s.PostCode, s.IsValidPostCode.ToString().ToUpper(), s.City, s.Phone
                            }
                        }).ToList();

            // Send the data to the jQGrid
            var jsonData = new {
                total = totalPages,
                page = page,
                records = totalRecords,
                rows = data.Skip((page - 1) * rows).Take(rows)
            };

            return Json(jsonData);
        }

        public JsonResult SavePersons(string lista) {
            //XmlDocument xmlDoc = JsonToXML(lista);

            //Došli su samo ispravni!
            //Send JSON data to Stored procedure
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Imenik"].ToString());
            SqlCommand command = new SqlCommand("SavePersons", connection);
            command.CommandType = CommandType.StoredProcedure;

            SqlParameter parameter = new SqlParameter("@lista", SqlDbType.VarChar);
            parameter.Value = lista;
            parameter.Direction = ParameterDirection.Input;
            command.Parameters.Add(parameter);

            SqlParameter returnValue = new SqlParameter("@retVal", SqlDbType.VarChar, 100);
            returnValue.Direction = ParameterDirection.Output;
            command.Parameters.Add(returnValue);

            SqlParameter returnNumber = new SqlParameter("@retNum", SqlDbType.Int);
            returnNumber.Direction = ParameterDirection.ReturnValue;
            command.Parameters.Add(returnNumber);

            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();

            if(returnValue.Value.ToString() == "OK")
                return Json("OK");
            else
                return Json("ERROR");
        }
    }
}
