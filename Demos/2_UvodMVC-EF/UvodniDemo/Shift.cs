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
    
    public partial class Shift
    {
        public Shift()
        {
            this.EmployeeDepartmentHistories = new HashSet<EmployeeDepartmentHistory>();
        }
    
        public byte ShiftID { get; set; }
        public string Name { get; set; }
        public System.DateTime StartTime { get; set; }
        public System.DateTime EndTime { get; set; }
        public System.DateTime ModifiedDate { get; set; }
    
        public virtual ICollection<EmployeeDepartmentHistory> EmployeeDepartmentHistories { get; set; }
    }
}
