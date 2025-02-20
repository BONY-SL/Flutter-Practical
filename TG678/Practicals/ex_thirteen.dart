import 'dart:io';

void main() {
  print("Please enter a long string with multiple words:");
  String userInput = stdin.readLineSync()!;

  String reversedString = reverseWords(userInput);

  print("The string with words in reverse order is:");
  print(reversedString);
}

String reverseWords(String input) {
  List<String> words = input.split(" ");
  words = words.reversed.toList();
  return words.join(" ");
}
