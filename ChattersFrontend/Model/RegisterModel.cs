using System.ComponentModel.DataAnnotations;

public class RegisterModel
{
    [Required(ErrorMessage = "Adres email jest wymagany.")]
    [EmailAddress(ErrorMessage = "Nieprawidłowy format adresu email.")]
    public string Email { get; set; } = string.Empty; // <-- ZMIANA TUTAJ

    [Required(ErrorMessage = "Hasło jest wymagane.")]
    [StringLength(100, MinimumLength = 8, ErrorMessage = "Hasło musi mieć co najmniej 8 znaków.")]
    public string Password { get; set; } = string.Empty; // <-- ZMIANA TUTAJ

    [Required(ErrorMessage = "Potwierdzenie hasła jest wymagane.")]
    [Compare("Password", ErrorMessage = "Hasła nie są zgodne.")]
    public string ConfirmPassword { get; set; } = string.Empty; // <-- ZMIANA TUTAJ
}