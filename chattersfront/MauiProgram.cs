using Microsoft.Extensions.Logging;
using Microsoft.AspNetCore.Components.Authorization;
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
                });

            builder.Services.AddMauiBlazorWebView();

#if DEBUG
		    builder.Services.AddBlazorWebViewDeveloperTools();
		    builder.Logging.AddDebug();
#endif
            
            // --- OSTATECZNA, POPRAWNA KONFIGURACJA USŁUG ---

            builder.Services.AddAuthorizationCore();

            // HttpClient jest zawsze Singletonem.
            builder.Services.AddSingleton<HttpClient>(sp =>
            {
                string baseAddress;
                #if ANDROID
                    baseAddress = "http://10.0.2.2:5244"; 
                #else
                    baseAddress = "http://127.0.0.1:5244";
                #endif
                
                return new HttpClient { BaseAddress = new System.Uri(baseAddress) };
            });

            // Usługi, które przechowują stan sesji użytkownika (jak stan logowania)
            // MUSZĄ być Scoped, aby były zgodne z cyklem życia Blazora.
            builder.Services.AddScoped<CustomAuthenticationStateProvider>();
            builder.Services.AddScoped<AuthenticationStateProvider>(sp => 
                sp.GetRequiredService<CustomAuthenticationStateProvider>());
            
            // Usługi, które zależą od stanu sesji, również muszą być Scoped.
            builder.Services.AddScoped<AuthService>();
            builder.Services.AddScoped<ChatService>();
            
            builder.Services.AddSingleton<WeatherForecastService>();

            return builder.Build();
        }
    }
}
