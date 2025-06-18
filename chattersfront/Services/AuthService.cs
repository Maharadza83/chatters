// -----------------------------------------------------------------------------
// Plik: chattersfront/Services/AuthService.cs
// Opis: Usługa do komunikacji z endpointami uwierzytelniania backendu (rejestracja, logowanie).
// -----------------------------------------------------------------------------
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;
using chattersfront.Models; // Zmienione z ChatApp.Frontend.Models
using System; // Dodane dla Guid
using System.Collections.Generic; // Dodane dla List

namespace chattersfront.Services
{
    public class AuthService
    {
        private readonly HttpClient _httpClient;

        public AuthService(IHttpClientFactory httpClientFactory)
        {
            _httpClient = httpClientFactory.CreateClient("BackendApi");
        }

        public async Task<LoginResponse?> Login(LoginRequest request)
        {
            try
            {
                var response = await _httpClient.PostAsJsonAsync("api/Auth/login", request);
                if (response.IsSuccessStatusCode)
                {
                    return await response.Content.ReadFromJsonAsync<LoginResponse>();
                }
                // Możesz dodać logowanie błędów lub zwracać bardziej szczegółowe informacje
                Console.WriteLine($"Login failed: {response.StatusCode} {await response.Content.ReadAsStringAsync()}");
                return null;
            }
            catch (HttpRequestException ex)
            {
                // Obsługa błędów sieciowych
                Console.WriteLine($"Błąd sieci podczas logowania: {ex.Message}");
                return null;
            }
        }

        public async Task<bool> Register(RegisterRequest request)
        {
            try
            {
                var response = await _httpClient.PostAsJsonAsync("api/Auth/register", request);
                if (!response.IsSuccessStatusCode)
                {
                    Console.WriteLine($"Register failed: {response.StatusCode} {await response.Content.ReadAsStringAsync()}");
                }
                return response.IsSuccessStatusCode;
            }
            catch (HttpRequestException ex)
            {
                Console.WriteLine($"Błąd sieci podczas rejestracji: {ex.Message}");
                return false;
            }
        }
    }
}
