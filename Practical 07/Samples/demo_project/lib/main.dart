import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); // Removed const as MyApp constructor is not const
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Keep the const constructor for MyApp

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('ListView Example')), // Use const for AppBar
        body: ListView(
          children: List.generate(10, (index) {
            return ListTile(
              leading: const Icon(Icons.label), // Use const for Icon
              title: Text('Item $index'),
            );
          }),
        ),
      ),
    );
  }
}
