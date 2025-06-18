// -----------------------------------------------------------------------------
// Plik: Program.cs
// Opis: Główny plik konfiguracyjny aplikacji ASP.NET Core.
//       Odpowiada za konfigurację usług, potoku żądań HTTP i uruchamianie aplikacji.
// -----------------------------------------------------------------------------
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi.Models;
using System.Text;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using ChatApp.Backend.Data;
using ChatApp.Backend.Models;
using ChatApp.Backend.Hubs;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection; // Dodane, aby użyć CreateScope

var builder = WebApplication.CreateBuilder(args);

// Dodawanie usług do kontenera.

// Konfiguracja baz danych
// Używamy PostgreSQL jako głównej bazy danych dla persystencji danych.
// Ciąg połączenia jest pobierany z konfiguracji (np. appsettings.json).
var connectionString = builder.Configuration.GetConnectionString("DefaultConnection") ??
                       throw new InvalidOperationException("Connection string 'DefaultConnection' not found.");

builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseNpgsql(connectionString));

// Dodawanie usług ASP.NET Core Identity
// Konfiguracja Identity do używania niestandardowego modelu ApplicationUser i ról.
builder.Services.AddDefaultIdentity<ApplicationUser>(options => options.SignIn.RequireConfirmedAccount = false)
    .AddRoles<IdentityRole>() // Włączenie wsparcia dla ról
    .AddEntityFrameworkStores<ApplicationDbContext>();

// Konfiguracja uwierzyteltniania JWT Bearer
// Pozwala na bezpieczne uwierzytelnianie użytkowników za pomocą tokenów JWT.
builder.Services.AddAuthentication(options =>
    {
        options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
        options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
        options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
    })
    .AddJwtBearer(options =>
    {
        options.TokenValidationParameters = new TokenValidationParameters
        {
            ValidIssuer = builder.Configuration["Jwt:Issuer"],
            ValidAudience = builder.Configuration["Jwt:Audience"],
            IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(builder.Configuration["Jwt:Key"]!)),
            ValidateIssuer = true,
            ValidateAudience = true,
            ValidateLifetime = true,
            ValidateIssuerSigningKey = true
        };
        // Umożliwienie przekazywania tokenów JWT przez SignalR
        options.Events = new JwtBearerEvents
        {
            OnMessageReceived = context =>
            {
                var accessToken = context.Request.Query["access_token"];

                // Jeśli żądanie jest do Huba SignalR
                var path = context.HttpContext.Request.Path;
                if (!string.IsNullOrEmpty(accessToken) &&
                    (path.StartsWithSegments("/chatHub")))
                {
                    // Ustawia token JWT na nagłówek autoryzacji
                    context.Token = accessToken;
                }
                return Task.CompletedTask;
            }
        };
    });

// Dodawanie autoryzacji (opartej na rolach i politykach)
builder.Services.AddAuthorization(options =>
{
    // Przykład polityki wymagającej roli "Administrator Organizacji"
    options.AddPolicy("RequireOrganizationAdminRole", policy =>
        policy.RequireRole("Administrator Organizacji"));

    // Przykład polityki wymagającej specyficznego OrganizationId dla zasobu
    options.AddPolicy("OrganizationAccess", policy =>
        policy.RequireAssertion(context =>
            context.User.HasClaim(c => c.Type == "OrganizationId" &&
                                      c.Value == context.Resource?.ToString()))); // Przykład, do dopracowania
});

// Dodawanie kontrolerów i Swagger/OpenAPI
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new OpenApiInfo { Title = "ChatApp API", Version = "v1" });
    // Dodanie konfiguracji dla autoryzacji JWT w Swagger UI
    c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
    {
        In = ParameterLocation.Header,
        Description = "Proszę podać token JWT",
        Name = "Authorization",
        Type = SecuritySchemeType.Http,
        BearerFormat = "JWT",
        Scheme = "Bearer"
    });
    c.AddSecurityRequirement(new OpenApiSecurityRequirement
    {
        {
            new OpenApiSecurityScheme
            {
                Reference = new OpenApiReference
                {
                    Type = ReferenceType.SecurityScheme,
                    Id = "Bearer"
                }
            },
            new string[] {}
        }
    });
});

// Dodawanie SignalR
builder.Services.AddSignalR();

// Dodawanie CORS dla frontendów (np. MAUI Blazor Hybrid)
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowSpecificOrigin",
        builder => builder.WithOrigins("http://localhost:5000", "https://localhost:5001") // Zastąp rzeczywistymi adresami frontendów
            .AllowAnyHeader()
            .AllowAnyMethod()
            .AllowCredentials()); // Niezbędne dla SignalR i uwierzytelniania
});

var app = builder.Build();

// KOD DO INICJALIZACJI RÓL I DANYCH (Wykonuje się raz przy starcie aplikacji)
using (var scope = app.Services.CreateScope())
{
    var roleManager = scope.ServiceProvider.GetRequiredService<RoleManager<IdentityRole>>();
    var userManager = scope.ServiceProvider.GetRequiredService<UserManager<ApplicationUser>>(); // Jeśli potrzebujesz inicjalizować też użytkowników

    string[] roleNames = { "User", "Administrator Organizacji", "Project Manager" }; // Definiuj role
    foreach (var roleName in roleNames)
    {
        var roleExist = await roleManager.RoleExistsAsync(roleName);
        if (!roleExist)
        {
            // Utwórz rolę, jeśli nie istnieje
            await roleManager.CreateAsync(new IdentityRole(roleName));
            app.Logger.LogInformation($"Rola '{roleName}' została utworzona.");
        }
    }

    // Opcjonalnie: Inicjalizacja domyślnego użytkownika administracyjnego
    // var adminUser = await userManager.FindByEmailAsync("admin@example.com");
    // if (adminUser == null)
    // {
    //     adminUser = new ApplicationUser { UserName = "admin@example.com", Email = "admin@example.com", FullName = "System Admin" };
    //     var result = await userManager.CreateAsync(adminUser, "AdminPass123!"); // ZMIEŃ HASŁO!
    //     if (result.Succeeded)
    //     {
    //         await userManager.AddToRoleAsync(adminUser, "Administrator Organizacji");
    //         app.Logger.LogInformation("Domyślny użytkownik administratora został utworzony.");
    //     }
    // }
}


// Konfiguracja potoku żądań HTTP.
if (app.Environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseCors("AllowSpecificOrigin"); // Zastosowanie polityki CORS

app.UseAuthentication(); // Musi być przed UseAuthorization
app.UseAuthorization();

app.MapControllers(); // Mapowanie kontrolerów HTTP
app.MapHub<ChatHub>("/chatHub"); // Mapowanie huba SignalR

app.Run();