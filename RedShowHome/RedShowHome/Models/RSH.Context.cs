﻿//------------------------------------------------------------------------------
// <auto-generated>
//    此代码是根据模板生成的。
//
//    手动更改此文件可能会导致应用程序中发生异常行为。
//    如果重新生成代码，则将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace RedShowHome.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class RedShowHomeEntities : DbContext
    {
        public RedShowHomeEntities()
            : base("name=RedShowHomeEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Collection> Collection { get; set; }
        public DbSet<Demand> Demand { get; set; }
        public DbSet<DesignCompany_User> DesignCompany_User { get; set; }
        public DbSet<Designer_User> Designer_User { get; set; }
        public DbSet<EnjoyStyle> EnjoyStyle { get; set; }
        public DbSet<HouseOwner> HouseOwner { get; set; }
        public DbSet<Normal_User> Normal_User { get; set; }
        public DbSet<RSH_User> RSH_User { get; set; }
        public DbSet<Seller_User> Seller_User { get; set; }
        public DbSet<RSH_House> RSH_House { get; set; }
        public DbSet<sysdiagrams> sysdiagrams { get; set; }
        public DbSet<AddressPoint> AddressPoint { get; set; }
    }
}
