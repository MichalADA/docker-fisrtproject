import random
import string

def generate_password(length, use_digits, use_special_chars):
    """Generuje losowe hasło zgodnie z podanymi kryteriami."""
    characters = string.ascii_letters
    if use_digits:
        characters += string.digits
    if use_special_chars:
        characters += string.punctuation

    return ''.join(random.choice(characters) for i in range(length))

def get_valid_input(prompt, type_func, condition_func):
    """Pobiera od użytkownika poprawne dane wejściowe."""
    while True:
        try:
            value = type_func(input(prompt))
            if not condition_func(value):
                raise ValueError
            return value
        except ValueError:
            print("Nieprawidłowe dane wejściowe, spróbuj ponownie.")

def get_yes_no_input(prompt):
    """Pobiera od użytkownika odpowiedź 't' (tak) lub 'n' (nie)."""
    return get_valid_input(prompt, str, lambda x: x.lower() in ['t', 'n']) == 't'

# Zbieranie danych wejściowych od użytkownika
number_of_passwords = get_valid_input("Ile haseł wygenerować?: ", int, lambda x: x > 0)
password_length = get_valid_input("Podaj długość hasła (minimum 8 znaków): ", int, lambda x: x >= 8)
include_digits = get_yes_no_input("Czy hasło ma zawierać cyfry? (t/n): ")
include_special = get_yes_no_input("Czy hasło ma zawierać znaki specjalne? (t/n): ")

# Generowanie i wyświetlanie haseł
for _ in range(number_of_passwords):
    print("Wygenerowane hasło:", generate_password(password_length, include_digits, include_special))

