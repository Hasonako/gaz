﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class gazEntities : DbContext
    {
        public gazEntities()
            : base("name=gazEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<authorization> authorization { get; set; }
        public virtual DbSet<distributionArz> distributionArz { get; set; }
        public virtual DbSet<distributionNN> distributionNN { get; set; }
        public virtual DbSet<Event> Event { get; set; }
        public virtual DbSet<Pipeline> Pipeline { get; set; }
        public virtual DbSet<UserTask> UserTask { get; set; }
    }
}
