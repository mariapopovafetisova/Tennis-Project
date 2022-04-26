using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Tennis.Models;

namespace Tennis.Data
{
    public class ApplicationDbContext : IdentityDbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {


        }
        
        public DbSet<MatchDetails>MatchDetails{ get; set; }
        public DbSet<FirstPlayer> FirstPlayer { get; set; }
        public DbSet<SecondPlayer> SecondPlayer{ get; set; }
        
        public DbSet<pointListFP> pointListFP { get; set; }
        public DbSet<pointListSP> pointListSP { get; set; }
        public DbSet<ErrorsFP> ErrorsFP { get; set; }
        public DbSet<ErrorsSP> ErrorsSP { get; set; }
      

        public DbSet<ListError> ListError { get; set; }
       

        public DbSet<LoginForm> LoginForm { get; set; }
        public DbSet<RegistrationForm>RegistrationForm { get; set; }
        public DbSet<UserProfile> UserProfile { get; set; }
        public DbSet<ReportStats> ReportStats { get; set; }
        public DbSet<Match> Match { get; set; }
        

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
        }


    }
    
}
