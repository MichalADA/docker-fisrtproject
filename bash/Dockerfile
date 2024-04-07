#FROM ubuntu:22:04 - zly format
FROM ubuntu:22.04



# Kopiowanie skryptu do kontenera
COPY password-generator.sh /password-generator.sh

# Nadaje uprawnienia do wykonania
RUN chmod +x /password-generator.sh

# Ustawiam skrypt jako punkt wejścia
ENTRYPOINT ["/password-generator.sh"]
