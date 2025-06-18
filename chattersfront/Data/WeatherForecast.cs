// -----------------------------------------------------------------------------
// Plik: chattersfront/Data/WeatherForecast.cs
// Opis: Przykładowy model danych z domyślnego szablonu MAUI Blazor.
// -----------------------------------------------------------------------------
namespace chattersfront.Data
{
    public class WeatherForecast
    {
        public DateTime Date { get; set; }

        public int TemperatureC { get; set; }

        public string? Summary { get; set; }

        public int TemperatureF => 32 + (int)(TemperatureC / 0.5556);
    }
}