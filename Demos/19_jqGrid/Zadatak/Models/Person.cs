using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Zadatak.Models {
    public class Person {
        public string Name { get; set; }
        public string Surname { get; set; }
        public string PostCode { get; set; }
        public bool IsValidPostCode { get; set; }
        public string City { get; set; }
        public string Phone { get; set; }
    }
}