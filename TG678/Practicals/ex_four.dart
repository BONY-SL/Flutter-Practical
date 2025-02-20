import 'dart:io';

void main() {
  print("Enter Length One: ");
  String? input = stdin.readLineSync(); 
  double lengthOne = double.parse(input!); 
  
  print("Enter Length Two: ");
  String? input2 = stdin.readLineSync(); 
  double lengthOne2 = double.parse(input2!); 


  double area = calculateAreaOfRectangle(lengthOne,lengthOne2);
  print("Area is : $area");

}

double calculateAreaOfRectangle(double lengthOne, double lengthOne2) {

  double area = lengthOne*lengthOne2;

  return area;
}
