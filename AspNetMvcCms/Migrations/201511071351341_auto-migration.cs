namespace AspNetMvcCms.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class automigration : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.CommentReplies",
                c => new
                    {
                        Id = c.Long(nullable: false, identity: true),
                        ReplyText = c.String(),
                        CreationDate = c.DateTime(nullable: false),
                        ModificationDate = c.DateTime(nullable: false),
                        CreateBy = c.String(),
                        ModifyBy = c.String(),
                        Status = c.Int(nullable: false),
                        Comment_Id = c.Long(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Comments", t => t.Comment_Id)
                .Index(t => t.Comment_Id);
            
            CreateTable(
                "dbo.Comments",
                c => new
                    {
                        Id = c.Long(nullable: false, identity: true),
                        CommentText = c.String(),
                        CreationDate = c.DateTime(nullable: false),
                        ModificationDate = c.DateTime(nullable: false),
                        CreateBy = c.String(),
                        ModifyBy = c.String(),
                        Status = c.Int(nullable: false),
                        Page_Id = c.Long(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Pages", t => t.Page_Id)
                .Index(t => t.Page_Id);
            
            CreateTable(
                "dbo.Pages",
                c => new
                    {
                        Id = c.Long(nullable: false, identity: true),
                        Title = c.String(),
                        MetaKeyword = c.String(),
                        MetaDescription = c.String(),
                        ShortDescription = c.String(),
                        Body = c.Binary(),
                        CreationDate = c.DateTime(nullable: false),
                        ModificationDate = c.DateTime(nullable: false),
                        CreateBy = c.String(),
                        ModifyBy = c.String(),
                        Status = c.Int(nullable: false),
                        PageCategory_Id = c.Long(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.PageCategories", t => t.PageCategory_Id)
                .Index(t => t.PageCategory_Id);
            
            CreateTable(
                "dbo.Menus",
                c => new
                    {
                        Id = c.Long(nullable: false, identity: true),
                        Name = c.String(),
                        DisplayText = c.String(),
                        Url = c.String(),
                        ActionType = c.Int(nullable: false),
                        Order = c.Int(nullable: false),
                        CreationDate = c.DateTime(nullable: false),
                        ModificationDate = c.DateTime(nullable: false),
                        CreateBy = c.String(),
                        ModifyBy = c.String(),
                        Status = c.Int(nullable: false),
                        Parent_Id = c.Long(),
                        Page_Id = c.Long(),
                        PageCategory_Id = c.Long(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Menus", t => t.Parent_Id)
                .ForeignKey("dbo.Pages", t => t.Page_Id)
                .ForeignKey("dbo.PageCategories", t => t.PageCategory_Id)
                .Index(t => t.Parent_Id)
                .Index(t => t.Page_Id)
                .Index(t => t.PageCategory_Id);
            
            CreateTable(
                "dbo.PageCategories",
                c => new
                    {
                        Id = c.Long(nullable: false, identity: true),
                        Name = c.String(),
                        CreationDate = c.DateTime(nullable: false),
                        ModificationDate = c.DateTime(nullable: false),
                        CreateBy = c.String(),
                        ModifyBy = c.String(),
                        Status = c.Int(nullable: false),
                        Parent_Id = c.Long(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.PageCategories", t => t.Parent_Id)
                .Index(t => t.Parent_Id);
            
            CreateTable(
                "dbo.SiteSettings",
                c => new
                    {
                        Id = c.Long(nullable: false, identity: true),
                        SiteTitle = c.String(),
                        SiteSlogan = c.String(),
                        SiteDomain = c.String(),
                        BannerImage = c.String(),
                        SiteLogo = c.String(),
                        Favicon = c.String(),
                        CreationDate = c.DateTime(nullable: false),
                        ModificationDate = c.DateTime(nullable: false),
                        CreateBy = c.String(),
                        ModifyBy = c.String(),
                        Status = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Menus", "PageCategory_Id", "dbo.PageCategories");
            DropForeignKey("dbo.PageCategories", "Parent_Id", "dbo.PageCategories");
            DropForeignKey("dbo.Pages", "PageCategory_Id", "dbo.PageCategories");
            DropForeignKey("dbo.Menus", "Page_Id", "dbo.Pages");
            DropForeignKey("dbo.Menus", "Parent_Id", "dbo.Menus");
            DropForeignKey("dbo.CommentReplies", "Comment_Id", "dbo.Comments");
            DropForeignKey("dbo.Comments", "Page_Id", "dbo.Pages");
            DropIndex("dbo.Menus", new[] { "PageCategory_Id" });
            DropIndex("dbo.PageCategories", new[] { "Parent_Id" });
            DropIndex("dbo.Pages", new[] { "PageCategory_Id" });
            DropIndex("dbo.Menus", new[] { "Page_Id" });
            DropIndex("dbo.Menus", new[] { "Parent_Id" });
            DropIndex("dbo.CommentReplies", new[] { "Comment_Id" });
            DropIndex("dbo.Comments", new[] { "Page_Id" });
            DropTable("dbo.SiteSettings");
            DropTable("dbo.PageCategories");
            DropTable("dbo.Menus");
            DropTable("dbo.Pages");
            DropTable("dbo.Comments");
            DropTable("dbo.CommentReplies");
        }
    }
}
