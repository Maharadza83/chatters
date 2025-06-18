// -----------------------------------------------------------------------------
// Plik: chattersfront/App.xaml.cs
// Opis: Kod-behind dla pliku App.xaml, główna klasa aplikacji MAUI.
// -----------------------------------------------------------------------------
using Microsoft.Maui.Controls;
using Microsoft.Maui.Controls.Xaml;
using Microsoft.Maui.ApplicationModel;

namespace chattersfront
{
    public partial class App : Application
    {
        public App()
        {
            // InitializeComponent() jest generowane automatycznie przez kompilator XAML
            // i łączy kod C# z UI zdefiniowanym w App.xaml.
            InitializeComponent();

            // Ustawienie strony głównej aplikacji.
            // Domyślnie w szablonie Blazor App MainPage jest używane jako strona główna.
            MainPage = new MainPage(); // W nowych szablonach MAUI często jest AppShell()
        }
    }
}