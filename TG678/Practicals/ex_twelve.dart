import 'dart:io';

void main() {

  
  print("How many Fibonacci numbers would you like to generate?");
  int? n = int.parse(stdin.readLineSync()!);


  List<int> fibonacciNumbers = generateFibonacci(n);


  print("The first $n Fibonacci numbers are: $fibonacciNumbers");
}

List<int> generateFibonacci(int n) {
  List<int> fibonacciSequence = [];
  

  if (n <= 0) {
    print("Please enter a positive integer.");
    return fibonacciSequence;
  }
  
  fibonacciSequence.add(0);
  
  if (n > 1) {
    fibonacciSequence.add(1);
  }
  
  for (int i = 2; i < n; i++) {
    int nextNumber = fibonacciSequence[i - 1] + fibonacciSequence[i - 2];
    fibonacciSequence.add(nextNumber);
  }

  return fibonacciSequence;
}
