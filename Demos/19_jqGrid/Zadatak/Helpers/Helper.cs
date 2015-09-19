using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq.Expressions;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using System.Xml;
using System.Xml.Linq;
using Zadatak.Models;

namespace Zadatak.Helpers {
    public class Helper {

        // Utility method to sort IQueryable given a field name as "string"
        // May consider to put in a cental place to be shared
        public static IQueryable<T> SortIQueryable<T>(IQueryable<T> data, string fieldName, string sortOrder) {
            if (string.IsNullOrWhiteSpace(fieldName)) return data;
            if (string.IsNullOrWhiteSpace(sortOrder)) return data;

            var param = Expression.Parameter(typeof(T), "i");
            Expression conversion = Expression.Convert(Expression.Property(param, fieldName), typeof(object));
            var mySortExpression = Expression.Lambda<Func<T, object>>(conversion, param);

            return (sortOrder == "desc") ? data.OrderByDescending(mySortExpression)
                : data.OrderBy(mySortExpression);
        }

        public static DataTable GetDataTableFromCsv(string path) {
            DataTable dataTable = new DataTable();
            String[] csv = System.IO.File.ReadAllLines(path);

            foreach (string csvrow in csv) {
                var fields = csvrow.Split(';'); // csv delimiter
                var row = dataTable.NewRow();

                row.ItemArray = fields;
                dataTable.Rows.Add(row);
            }

            return dataTable;
        }

        public static List<Person> GetListFromCsv(string path) {
            StreamReader reader = new StreamReader(System.IO.File.OpenRead(HttpContext.Current.Server.MapPath(path)));
            List<Person> retVal = new List<Person>();

            while (!reader.EndOfStream) {
                string line = reader.ReadLine();
                if (!String.IsNullOrWhiteSpace(line)) {
                    string[] values = line.Split(';');
                    if (values.Length >= 5) {
                        bool isOK = false;
                        int postCode = 0;
                        isOK = int.TryParse(values[2], out postCode);

                        Person person = new Person() {
                            Name = values[0],
                            Surname = values[1],
                            PostCode = values[2],
                            IsValidPostCode = isOK,
                            City = values[3],
                            Phone = values[4]
                        };
                        retVal.Add(person);
                    }
                }
            }
            return retVal;
        }

        public static XmlDocument JsonToXML(string json) {
            XmlDocument doc = new XmlDocument();

            using (var reader = JsonReaderWriterFactory.CreateJsonReader(Encoding.UTF8.GetBytes(json), XmlDictionaryReaderQuotas.Max)) {
                XElement xml = XElement.Load(reader);
                doc.LoadXml(xml.ToString());
            }

            return doc;
        }


    }
}