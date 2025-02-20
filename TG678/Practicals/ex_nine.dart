void main() {
  // List to hold all products
  List<Map> productsDetails = [

    {'id': 100, 'name': 'Bat', 'price': 3580.50},

  ];

  print("Original productsDetails: ${productsDetails.toString()}");

  // Second product
  var product2 = {
    'id': 200,
    'name': 'Ball',
    'price': 750
  };

  productsDetails.add(product2);

  
  productsDetails[0]['category'] = 'Sports'; 
  productsDetails[1]['category'] = 'Sports';  

  print("Updated productsDetails: ${productsDetails.toString()}");

}
