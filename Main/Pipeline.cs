//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace gaz.Main
{
    using System;
    using System.Collections.Generic;
    
    public partial class Pipeline
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Pipeline()
        {
            this.Events = new HashSet<Event>();
        }
    
        public int PipelineID { get; set; }
        public int Code { get; set; }
        public string Location { get; set; }
        public Nullable<System.DateTime> InstallationDate { get; set; }
        public Nullable<System.DateTime> LastInspectionDate { get; set; }
        public Nullable<System.DateTime> NextInspectionDate { get; set; }
        public string Status { get; set; }
        public Nullable<double> Pressure { get; set; }
        public Nullable<double> Length { get; set; }
        public string Notes { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Event> Events { get; set; }
    }
}
