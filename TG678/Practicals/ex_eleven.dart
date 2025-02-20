void main() {
  List dublicateList = [10, 20, 5, 40, 40, 80, 60, 50, 50, 10, 5];

  print("Duplicated List : $dublicateList");

  print("After Remove Duplicated Values : ${removeDuplicatedValues(dublicateList)}");
}

List removeDuplicatedValues(List getList) {
  List list = [];
  
  for (int a = 0; a < getList.length; a++) {
    int i = getList[a];
    if (!list.contains(i)) {
      list.add(i);
    }
  }

  return list;
}
