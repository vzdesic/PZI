//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace UvodniDemo
{
    using System;
    using System.Collections.Generic;
    
    public partial class Address
    {
        public Address()
        {
            this.EmployeeAddresses = new HashSet<EmployeeAddress>();
            this.CustomerAddresses = new HashSet<CustomerAddress>();
            this.SalesOrderHeaders = new HashSet<SalesOrderHeader>();
            this.SalesOrderHeaders1 = new HashSet<SalesOrderHeader>();
            this.VendorAddresses = new HashSet<VendorAddress>();
        }
    
        public int AddressID { get; set; }
        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public string City { get; set; }
        public int StateProvinceID { get; set; }
        public string PostalCode { get; set; }
        public System.Guid rowguid { get; set; }
        public System.DateTime ModifiedDate { get; set; }
    
        public virtual ICollection<EmployeeAddress> EmployeeAddresses { get; set; }
        public virtual StateProvince StateProvince { get; set; }
        public virtual ICollection<CustomerAddress> CustomerAddresses { get; set; }
        public virtual ICollection<SalesOrderHeader> SalesOrderHeaders { get; set; }
        public virtual ICollection<SalesOrderHeader> SalesOrderHeaders1 { get; set; }
        public virtual ICollection<VendorAddress> VendorAddresses { get; set; }
    }
}
