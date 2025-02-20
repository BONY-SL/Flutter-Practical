class Student {
  String _name = "";
  int _age = 0;
  double _mark =0.0;

  String getName(){
    return this._name;
  }

  int getAge(){
    return this._age;
  }

  double getMark(){
    return this._mark;
  }

  void setName(String name){
    this._name = name;
  }

  void setAge(int age){
    this._age = age;
  }

  void setMark(double mark){
    this._mark = mark;
  }
}