import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('ListView.builder Example')),
        body: DynamicListView(),
      ),
    );
  }
}

class DynamicListView extends StatelessWidget {
  final List<String> items = List.generate(50, (index) => 'Item $index'); // Dynamically generate a list of items

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length, // The number of items in the list
      itemBuilder: (context, index) {
        // Building each item in the list dynamically
        return ListTile(
          leading: const Icon(Icons.label),
          title: Text(items[index]), // Display the item at the current index
        );
      },
    );
  }
}
