using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UvodniDemo.Models
{
    public class AllProductsAndAddresses
    {
        public List<Address> address { get; set; }
        public List<Product> products { get; set; }
    }
}