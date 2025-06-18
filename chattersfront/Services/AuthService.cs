using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;
using chattersfront.Models;

namespace chattersfront.Services
{
    public class AuthService
    {
        private readonly HttpClient _httpClient;
        private readonly CustomAuthenticationStateProvider _authStateProvider;

        public AuthService(HttpClient httpClient, CustomAuthenticationStateProvider authStateProvider)
        {
            _httpClient = httpClient;
            _authStateProvider = authStateProvider;
        }

        public async Task<LoginResponse?> Login(LoginRequest loginRequest)
        {
            try
            {
                var response = await _httpClient.PostAsJsonAsync("api/auth/login", loginRequest);
                if (!response.IsSuccessStatusCode) return null;

                var loginResponse = await response.Content.ReadFromJsonAsync<LoginResponse>();
                if (loginResponse != null && !string.IsNullOrEmpty(loginResponse.Token))
                {
                    _authStateProvider.MarkUserAsAuthenticated(loginResponse.Token);
                }
                return loginResponse;
            }
            catch (System.Exception)
            {
                return null;
            }
        }

        public async Task<bool> Register(RegisterRequest registerRequest)
        {
            var response = await _httpClient.PostAsJsonAsync("api/auth/register", registerRequest);
            return response.IsSuccessStatusCode;
        }

        public void Logout()
        {
            _authStateProvider.MarkUserAsLoggedOut();
        }
    }
}