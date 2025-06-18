// -----------------------------------------------------------------------------
// Plik: Controllers/AuthController.cs
// Opis: Kontroler do obsługi rejestracji i logowania użytkowników,
//       oraz generowania tokenów JWT.
// -----------------------------------------------------------------------------
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.IdentityModel.Tokens.Jwt; // Dodane explicite
using System.Security.Claims;
using Microsoft.IdentityModel.Tokens; // Dodane explicite
using ChatApp.Backend.Models;
using ChatApp.Backend.Data;
using Microsoft.EntityFrameworkCore;
using System; // Dodane dla Guid
using System.Collections.Generic; // Dodane dla IList
using System.Text; // Dodane dla Encoding
using System.Threading.Tasks; // Dodane dla Task
using Microsoft.AspNetCore.Authorization; // Dodane dla Authorize/AllowAnonymous
using Microsoft.Extensions.DependencyInjection; // Dodane dla GetRequiredService

namespace ChatApp.Backend.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly SignInManager<ApplicationUser> _signInManager;
        private readonly IConfiguration _configuration;
        private readonly ApplicationDbContext _dbContext;

        public AuthController(
            UserManager<ApplicationUser> userManager,
            SignInManager<ApplicationUser> signInManager,
            IConfiguration configuration,
            ApplicationDbContext dbContext)
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _configuration = configuration;
            _dbContext = dbContext;
        }

        // DTO dla rejestracji
        public class RegisterRequest
        {
            public string Email { get; set; } = null!;
            public string Password { get; set; } = null!;
            public string FullName { get; set; } = null!;
            public string OrganizationName { get; set; } = null!; // Nazwa organizacji, do której użytkownik się rejestruje
            public string ProjectName { get; set; } = null!; // Nazwa projektu
        }

        [HttpPost("register")]
        public async Task<IActionResult> Register([FromBody] RegisterRequest request)
        {
            // Sprawdź, czy organizacja już istnieje, w przeciwnym razie utwórz nową
            var organization = await _dbContext.Organizations
                .FirstOrDefaultAsync(o => o.Name == request.OrganizationName);

            if (organization == null)
            {
                organization = new Organization { Name = request.OrganizationName, Description = $"Organizacja {request.OrganizationName}" };
                _dbContext.Organizations.Add(organization);
                await _dbContext.SaveChangesAsync(); // Zapisz organizację, aby uzyskać Id
            }

            // Sprawdź, czy projekt już istnieje w danej organizacji, w przeciwnym razie utwórz nowy
            var project = await _dbContext.Projects
                .FirstOrDefaultAsync(p => p.Name == request.ProjectName && p.OrganizationId == organization.Id);

            if (project == null)
            {
                project = new Project { Name = request.ProjectName, Description = $"Projekt {request.ProjectName}", OrganizationId = organization.Id };
                _dbContext.Projects.Add(project);
                await _dbContext.SaveChangesAsync(); // Zapisz projekt, aby uzyskać Id
            }

            var user = new ApplicationUser
            {
                UserName = request.Email,
                Email = request.Email,
                FullName = request.FullName,
                OrganizationId = organization.Id, // Przypisanie ID organizacji
                ProjectId = project.Id // Przypisanie ID projektu
            };

            var result = await _userManager.CreateAsync(user, request.Password);

            if (result.Succeeded)
            {
                // Dodaj użytkownika do domyślnej roli, np. "User"
                await _userManager.AddToRoleAsync(user, "User");
                // Dodaj żądania dla OrganizationId i ProjectId
                await _userManager.AddClaimsAsync(user, new List<Claim>
                {
                    new Claim("OrganizationId", organization.Id.ToString()),
                    new Claim("ProjectId", project.Id.ToString())
                });

                return Ok(new { Message = "Rejestracja pomyślna!" });
            }

            return BadRequest(result.Errors);
        }

        // DTO dla logowania
        public class LoginRequest
        {
            public string Email { get; set; } = null!;
            public string Password { get; set; } = null!;
        }

        // DTO dla odpowiedzi logowania
        public class LoginResponse
        {
            public string Token { get; set; } = null!;
            public string UserId { get; set; } = null!;
            public string UserName { get; set; } = null!;
            public Guid? OrganizationId { get; set; }
            public Guid? ProjectId { get; set; }
            public IList<string> Roles { get; set; } = new List<string>();
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] LoginRequest request)
        {
            var user = await _userManager.FindByEmailAsync(request.Email);
            if (user == null)
            {
                return Unauthorized(new { Message = "Nieprawidłowe dane logowania." });
            }

            var result = await _signInManager.CheckPasswordSignInAsync(user, request.Password, false);
            if (result.Succeeded)
            {
                var roles = await _userManager.GetRolesAsync(user);
                var claims = await _userManager.GetClaimsAsync(user);

                var authClaims = new List<Claim>
                {
                    new Claim(ClaimTypes.NameIdentifier, user.Id),
                    new Claim(ClaimTypes.Email, user.Email!),
                    new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                    new Claim("OrganizationId", user.OrganizationId?.ToString() ?? ""), // Dodaj OrganizationId
                    new Claim("ProjectId", user.ProjectId?.ToString() ?? "") // Dodaj ProjectId
                };

                // Dodaj role jako claims
                foreach (var role in roles)
                {
                    authClaims.Add(new Claim(ClaimTypes.Role, role));
                }

                // Dodaj inne istniejące claims użytkownika
                authClaims.AddRange(claims);

                var token = GetToken(authClaims);

                return Ok(new LoginResponse
                {
                    Token = new JwtSecurityTokenHandler().WriteToken(token),
                    UserId = user.Id,
                    UserName = user.UserName!,
                    OrganizationId = user.OrganizationId,
                    ProjectId = user.ProjectId,
                    Roles = roles
                });
            }

            return Unauthorized(new { Message = "Nieprawidłowe dane logowania." });
        }

        private JwtSecurityToken GetToken(List<Claim> authClaims)
        {
            var authSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Jwt:Key"]!));

            var token = new JwtSecurityToken(
                issuer: _configuration["Jwt:Issuer"],
                audience: _configuration["Jwt:Audience"],
                expires: DateTime.Now.AddHours(3), // Token ważny przez 3 godziny
                claims: authClaims,
                signingCredentials: new SigningCredentials(authSigningKey, SecurityAlgorithms.HmacSha256)
            );

            return token;
        }

        // Testowy endpoint autoryzacji
        [HttpGet("protected")]
        [Authorize] // Tylko zalogowani użytkownicy
        public IActionResult ProtectedEndpoint()
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var email = User.FindFirstValue(ClaimTypes.Email);
            var orgId = User.FindFirstValue("OrganizationId");
            var projId = User.FindFirstValue("ProjectId");

            return Ok($"Witaj, {email}! Jesteś użytkownikiem o ID: {userId}, w organizacji: {orgId}, w projekcie: {projId}");
        }

        [HttpGet("admin-only")]
        [Authorize(Roles = "Administrator Organizacji")] // Tylko użytkownicy z rolą "Administrator Organizacji"
        public IActionResult AdminOnlyEndpoint()
        {
            return Ok("Masz dostęp do zasobów administratora organizacji!");
        }

        // Endpoint do tworzenia ról (tylko w celach testowych/inicjalizacyjnych)
        [HttpPost("create-role")]
        [AllowAnonymous] // Pozwól na dostęp bez autoryzacji dla łatwego testowania
        public async Task<IActionResult> CreateRole(string roleName)
        {
            var roleManager = HttpContext.RequestServices.GetRequiredService<RoleManager<IdentityRole>>();
            var roleExists = await roleManager.RoleExistsAsync(roleName);
            if (!roleExists)
            {
                var roleResult = await roleManager.CreateAsync(new IdentityRole(roleName));
                if (roleResult.Succeeded)
                {
                    return Ok($"Rola '{roleName}' została utworzona.");
                }
                return BadRequest(roleResult.Errors);
            }
            return Ok($"Rola '{roleName}' już istnieje.");
        }

        // Endpoint do przypisywania ról (tylko w celach testowych/inicjalizacyjnych)
        [HttpPost("assign-role")]
        [AllowAnonymous] // Pozwól na dostęp bez autoryzacji dla łatwego testowania
        public async Task<IActionResult> AssignRole(string userId, string roleName)
        {
            var user = await _userManager.FindByIdAsync(userId);
            if (user == null)
            {
                return NotFound($"Użytkownik o ID '{userId}' nie znaleziony.");
            }

            var roleManager = HttpContext.RequestServices.GetRequiredService<RoleManager<IdentityRole>>();
            var roleExists = await roleManager.RoleExistsAsync(roleName);
            if (!roleExists)
            {
                return BadRequest($"Rola '{roleName}' nie istnieje.");
            }

            var result = await _userManager.AddToRoleAsync(user, roleName);
            if (result.Succeeded)
            {
                return Ok($"Użytkownik '{user.UserName}' został przypisany do roli '{roleName}'.");
            }
            return BadRequest(result.Errors);
        }
    }
}
