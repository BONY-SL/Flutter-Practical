class Employee {
  String _name = ""; // Private variable

  // Getter method
  String get getName{
    return this._name;
  }

  // Setter method
  set setName(String newName) {

    this._name  = newName;
  }
}

void main() {

  // Creating an employee object
  Employee emp = Employee();

  // Setting a name using setter
  emp.setName = "Danindu Tharuka Dilshan"; 

  // Accessing name using getter
  print(emp.getName); 
}
