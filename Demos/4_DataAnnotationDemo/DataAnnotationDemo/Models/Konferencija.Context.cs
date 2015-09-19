﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataAnnotationDemo.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class KonferencijaEntities : DbContext
    {
        public KonferencijaEntities()
            : base("name=KonferencijaEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Hoteli> Hotelis { get; set; }
        public virtual DbSet<Polaznici> Polaznicis { get; set; }
        public virtual DbSet<Predavaci> Predavacis { get; set; }
        public virtual DbSet<Predavanja> Predavanjas { get; set; }
        public virtual DbSet<PrijaveNaPredavanja> PrijaveNaPredavanjas { get; set; }
        public virtual DbSet<Racuni> Racunis { get; set; }
        public virtual DbSet<sDvorane> sDvoranes { get; set; }
        public virtual DbSet<sGradovi> sGradovis { get; set; }
        public virtual DbSet<sSmjerovi> sSmjerovis { get; set; }
        public virtual DbSet<sTipoviPredavanja> sTipoviPredavanjas { get; set; }
        public virtual DbSet<sTvrtke> sTvrtkes { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<T> T { get; set; }
        public virtual DbSet<vComplexGetdateEtc> vComplexGetdateEtcs { get; set; }
        public virtual DbSet<vPregledTvrtki> vPregledTvrtkis { get; set; }
        public virtual DbSet<VT> VTs { get; set; }
        public virtual DbSet<vTvrtkeGroupBy> vTvrtkeGroupBies { get; set; }
    
        [DbFunction("KonferencijaEntities", "fjaPregledPredavanja")]
        public virtual IQueryable<fjaPregledPredavanja_Result> fjaPregledPredavanja()
        {
            return ((IObjectContextAdapter)this).ObjectContext.CreateQuery<fjaPregledPredavanja_Result>("[KonferencijaEntities].[fjaPregledPredavanja]()");
        }
    
        [DbFunction("KonferencijaEntities", "fjaPregledTvrtki")]
        public virtual IQueryable<fjaPregledTvrtki_Result> fjaPregledTvrtki()
        {
            return ((IObjectContextAdapter)this).ObjectContext.CreateQuery<fjaPregledTvrtki_Result>("[KonferencijaEntities].[fjaPregledTvrtki]()");
        }
    
        public virtual ObjectResult<PregledPredavanja_Result> PregledPredavanja()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<PregledPredavanja_Result>("PregledPredavanja");
        }
    
        public virtual int sp_alterdiagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_alterdiagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual int sp_creatediagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_creatediagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual int sp_dropdiagram(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_dropdiagram", diagramnameParameter, owner_idParameter);
        }
    
        public virtual ObjectResult<sp_helpdiagramdefinition_Result> sp_helpdiagramdefinition(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagramdefinition_Result>("sp_helpdiagramdefinition", diagramnameParameter, owner_idParameter);
        }
    
        public virtual ObjectResult<sp_helpdiagrams_Result> sp_helpdiagrams(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagrams_Result>("sp_helpdiagrams", diagramnameParameter, owner_idParameter);
        }
    
        public virtual int sp_renamediagram(string diagramname, Nullable<int> owner_id, string new_diagramname)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var new_diagramnameParameter = new_diagramname != null ?
                new ObjectParameter("new_diagramname", new_diagramname) :
                new ObjectParameter("new_diagramname", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_renamediagram", diagramnameParameter, owner_idParameter, new_diagramnameParameter);
        }
    
        public virtual int sp_upgraddiagrams()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_upgraddiagrams");
        }
    
        public virtual ObjectResult<spPregledPredavaca_Result> spPregledPredavaca(Nullable<System.DateTime> od, Nullable<System.DateTime> @do)
        {
            var odParameter = od.HasValue ?
                new ObjectParameter("od", od) :
                new ObjectParameter("od", typeof(System.DateTime));
    
            var doParameter = @do.HasValue ?
                new ObjectParameter("do", @do) :
                new ObjectParameter("do", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spPregledPredavaca_Result>("spPregledPredavaca", odParameter, doParameter);
        }
    }
}
