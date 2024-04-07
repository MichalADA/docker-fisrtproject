package main

import (
	"bufio"
	"fmt"
	"math/rand"
	"os"
	"strings"
	"time"
)

func generatePassword(length int, useDigits bool, useSpecialChars bool) string {
	var letters = []rune("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
	if useDigits {
		letters = append(letters, '0', '1', '2', '3', '4', '5', '6', '7', '8', '9')
	}
	if useSpecialChars {
		letters = append(letters, '!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '-', '_', '=', '+')
	}

	rand.Seed(time.Now().UnixNano())
	b := make([]rune, length)
	for i := range b {
		b[i] = letters[rand.Intn(len(letters))]
	}
	return string(b)
}

func main() {
	scanner := bufio.NewScanner(os.Stdin)

	fmt.Print("Ile haseł wygenerować?: ")
	scanner.Scan()
	var numberOfPasswords int
	fmt.Sscanf(scanner.Text(), "%d", &numberOfPasswords)

	fmt.Print("Podaj długość hasła (minimum 8 znaków): ")
	scanner.Scan()
	var passwordLength int
	fmt.Sscanf(scanner.Text(), "%d", &passwordLength)

	fmt.Print("Czy hasło ma zawierać cyfry? (t/n): ")
	scanner.Scan()
	includeDigits := strings.ToLower(scanner.Text()) == "t"

	fmt.Print("Czy hasło ma zawierać znaki specjalne? (t/n): ")
	scanner.Scan()
	includeSpecial := strings.ToLower(scanner.Text()) == "t"

	for i := 0; i < numberOfPasswords; i++ {
		fmt.Println("Wygenerowane hasło:", generatePassword(passwordLength, includeDigits, includeSpecial))
	}
}
