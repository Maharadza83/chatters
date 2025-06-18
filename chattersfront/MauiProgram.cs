// -----------------------------------------------------------------------------
// Plik: chattersfront/MauiProgram.cs
// Opis: Główny punkt wejścia i konfiguracja aplikacji MAUI Blazor Hybrid.
// Finalna wersja z cyklem życia Singleton i poprawką dla localhost na Windows.
// -----------------------------------------------------------------------------
using Microsoft.AspNetCore.Components.Authorization;
using Microsoft.Extensions.Logging;
using chattersfront.Services;
using chattersfront.Data; 

namespace chattersfront
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                });

            builder.Services.AddMauiBlazorWebView();

#if DEBUG
    		builder.Services.AddBlazorWebViewDeveloperTools();
    		builder.Logging.AddDebug();
#endif
            
            // --- POCZĄTEK POPRAWIONEJ KONFIGURACJI ---

            // 1. Rejestrujemy podstawowe usługi Blazora do autoryzacji.
            builder.Services.AddAuthorizationCore();

            // 2. Rejestrujemy nasz CustomAuthenticationStateProvider. Scoped jest tutaj prawidłowe.
            builder.Services.AddScoped<AuthenticationStateProvider, CustomAuthenticationStateProvider>();

            // 3. Rejestrujemy HttpClient jako Singleton z poprawnym adresem URL.
            //    WAŻNE: Adres URL i port muszą pasować do Twojego backendu!
            builder.Services.AddSingleton(sp =>
            {
                // Ta dyrektywa kompilatora wybierze właściwy adres w zależności od platformy
                string baseAddress;
                #if ANDROID
                    // Dla emulatora Android, 10.0.2.2 to alias do localhost komputera hosta.
                    baseAddress = "http://10.0.2.2:5244"; 
                #else
                    // Dla Windows, iOS, MacCatalyst używamy adresu IP 127.0.0.1 zamiast 'localhost',
                    // aby ominąć ograniczenia sieciowe AppContainer na Windows.
                    baseAddress = "http://127.0.0.1:5244"; // <<< KLUCZOWA ZMIANA
                #endif
                
                return new HttpClient { BaseAddress = new Uri(baseAddress) };
            });

            // 4. Rejestrujemy nasze główne serwisy jako Singleton.
            builder.Services.AddSingleton<AuthService>();
            builder.Services.AddSingleton<ChatService>();
            
            // Pozostawiamy domyślną usługę z szablonu.
            builder.Services.AddSingleton<WeatherForecastService>();

            // --- KONIEC POPRAWIONEJ KONFIGURACJI ---

            return builder.Build();
        }
    }
}
