import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image GridView'),
        ),
        body: ImageGrid(),
      ),
    );
  }
}

class ImageGrid extends StatelessWidget {
  final List<String> images = [
    'assets/images/Golden+Retrievers+dans+pet+care.jpeg',
    'assets/images/Golden+Retrievers+dans+pet+care.jpeg',
    'assets/images/Golden+Retrievers+dans+pet+care.jpeg',
    'assets/images/Golden+Retrievers+dans+pet+care.jpeg',
    'assets/images/Golden+Retrievers+dans+pet+care.jpeg',
    'assets/images/Golden+Retrievers+dans+pet+care.jpeg',
    'assets/images/Golden+Retrievers+dans+pet+care.jpeg',
    'assets/images/Golden+Retrievers+dans+pet+care.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of items per row
        crossAxisSpacing: 10, // Space between items horizontally
        mainAxisSpacing: 10, // Space between items vertically
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 5,
          child: Image.asset(
            images[index],
            fit: BoxFit.cover, // Adjust the image size
          ),
        );
      },
    );
  }
}
