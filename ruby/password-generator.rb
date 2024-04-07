def generate_password(length, use_digits, use_special_chars)
    characters = ('a'..'z').to_a + ('A'..'Z').to_a
    characters += (0..9).to_a if use_digits == 't'
    characters += ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '-', '_', '=', '+'] if use_special_chars == 't'
  
    Array.new(length) { characters.sample }.join
  end
  
  puts "Ile haseł wygenerować?: "
  number_of_passwords = gets.chomp.to_i
  puts "Podaj długość hasła (minimum 8 znaków): "
  password_length = gets.chomp.to_i
  puts "Czy hasło ma zawierać cyfry? (t/n): "
  include_digits = gets.chomp.downcase
  puts "Czy hasło ma zawierać znaki specjalne? (t/n): "
  include_special = gets.chomp.downcase
  
  number_of_passwords.times do
    puts "Wygenerowane hasło: #{generate_password(password_length, include_digits, include_special)}"
  end
  