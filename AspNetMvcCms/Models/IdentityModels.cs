using Microsoft.AspNet.Identity.EntityFramework;
using System.Data.Entity;

namespace AspNetMvcCms.Models
{
    // You can add profile data for the user by adding more properties to your ApplicationUser class, please visit http://go.microsoft.com/fwlink/?LinkID=317594 to learn more.
    
    
    public class ApplicationUser : IdentityUser
    {
    }

    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext()
            : base("AspNetMvcCms")
        {
        }
        public DbSet<Page> Pages { get; set; }
        public DbSet<PageCategory> PageCategory { get; set; }
        public DbSet<Menu> Menus { get; set; }
        public DbSet<Comment> Comments { get; set; }
        public DbSet<CommentReply> CommentReplies { get; set; }
        public DbSet<SiteSettings> SiteSettings { get; set; }

    }
}