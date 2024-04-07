#!/bin/bash

generate_password() {
    local length=$1
    local use_digits=$2
    local use_special_chars=$3
    local characters="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

    if [[ "$use_digits" == "t" ]]; then
        characters="${characters}0123456789"
    fi

    if [[ "$use_special_chars" == "t" ]]; then
        characters="${characters}!@#$%^&*()-_=+"
    fi

    local password=""
    for (( i=0; i<$length; i++ )); do
        password="${password}${characters:RANDOM%${#characters}:1}"
    done
    echo "$password"
}

read -p "Ile haseł wygenerować?: " number_of_passwords
read -p "Podaj długość hasła (minimum 8 znaków): " password_length
read -p "Czy hasło ma zawierać cyfry? (t/n): " include_digits
read -p "Czy hasło ma zawierać znaki specjalne? (t/n): " include_special

for (( i=0; i<$number_of_passwords; i++ )); do
    echo "Wygenerowane hasło: $(generate_password $password_length $include_digits $include_special)"
done
