import 'dart:math';
import 'dart:io';

void main() {

  print("Welcome to the password generator!");

  while (true) {
    print("\nEnter the desired password length:");
    int? length = int.parse(stdin.readLineSync()!);

    if (length <= 0) {
      print("Please enter a positive number for the password length.");
    } else {
      String newPassword = generatePassword(length);
      print("Generated password: $newPassword");
    }

    print("\nWould you like to generate another password? (yes/no)");
    String? response = stdin.readLineSync()?.toLowerCase();

    if (response != "yes") {
      print("Goodbye!");
      break;
    }
  }
}

String generatePassword(int length) {
  const lowercaseLetters = 'abcdefghijklmnopqrstuvwxyz';
  const uppercaseLetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const numbers = '0123456789';
  const symbols = '!@#\$%^&*()-=_+[]{}|;:,.<>?/~';

  const allCharacters = lowercaseLetters + uppercaseLetters + numbers + symbols;

  Random random = Random();

  String password = '';
  for (int i = 0; i < length; i++) {
    password += allCharacters[random.nextInt(allCharacters.length)];
  }

  return password;
}
