using System.ComponentModel.DataAnnotations;

public class LoginModel
{
    [Required(ErrorMessage = "Adres email jest wymagany.")]
    [EmailAddress(ErrorMessage = "Nieprawidłowy format adresu email.")]
    public string Email { get; set; } = string.Empty; // <-- ZMIANA TUTAJ

    [Required(ErrorMessage = "Hasło jest wymagane.")]
    public string Password { get; set; } = string.Empty; // <-- ZMIANA TUTAJ
}