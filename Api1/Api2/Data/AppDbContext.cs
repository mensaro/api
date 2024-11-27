using Api2.Models;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity;

namespace Api2.Data
{
    public class AppDbContext : IdentityDbContext<IdentityUser>
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        public DbSet<Game> Games { get; set; }
        public DbSet<Genre> Genres { get; set; }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);

            // Sembrar Roles
            var adminRoleId = "admin-role-id";
            var basicRoleId = "basic-role-id";

            builder.Entity<IdentityRole>().HasData(
                new IdentityRole { Id = adminRoleId, Name = "Admin", NormalizedName = "ADMIN" },
                new IdentityRole { Id = basicRoleId, Name = "Basic", NormalizedName = "BASIC" }
            );

            // Sembrar Usuarios
            var hasher = new PasswordHasher<IdentityUser>();

            var basicUser = new IdentityUser
            {
                Id = "basic-user-id",
                UserName = "basic@ejercicio4.com",
                NormalizedUserName = "BASIC@EJERCICIO4.COM",
                Email = "basic@ejercicio4.com",
                NormalizedEmail = "BASIC@EJERCICIO4.COM",
                EmailConfirmed = true
            };
            basicUser.PasswordHash = hasher.HashPassword(basicUser, "Password123!");

            var adminUser = new IdentityUser
            {
                Id = "admin-user-id",
                UserName = "admin@ejercicio4.com",
                NormalizedUserName = "ADMIN@EJERCICIO4.COM",
                Email = "admin@ejercicio4.com",
                NormalizedEmail = "ADMIN@EJERCICIO4.COM",
                EmailConfirmed = true
            };
            adminUser.PasswordHash = hasher.HashPassword(adminUser, "Password123!");

            builder.Entity<IdentityUser>().HasData(basicUser, adminUser);

            // Asignar Roles a Usuarios
            builder.Entity<IdentityUserRole<string>>().HasData(
                new IdentityUserRole<string> { RoleId = basicRoleId, UserId = "basic-user-id" },
                new IdentityUserRole<string> { RoleId = adminRoleId, UserId = "admin-user-id" }
            );
        }

    }
}
