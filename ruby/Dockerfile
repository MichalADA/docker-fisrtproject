# Oficialny obraz runy 
FROM ruby:latest

# Kopiowanie skryptu do kontenera
COPY password-generator.rb /password-generator.rb

# Ustawiam skrypt jako punkt wejścia
ENTRYPOINT ["ruby", "/password-generator.rb"]
