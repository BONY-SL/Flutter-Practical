import 'Student.dart';

void main() {
  
  Student student = new Student();

  student.setName("Danidu");
  student.setAge(24);
  student.setMark(82.5);

  print("Student Details....");
  print("Name : ${student.getName()}");
  print("Age : ${student.getAge()}");
  print("Mark : ${student.getMark()}");

  
}