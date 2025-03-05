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
        appBar: AppBar(title: Text('Draggable & DragTarget Example')),
        body: DragDropExample(),
      ),
    );
  }
}

class DragDropExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Draggable container
          Draggable<String>(
            data: "Draggable Container", // Data associated with the draggable item
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              child: const Center(
                child: Text('Drag me', style: TextStyle(color: Colors.white)),
              ),
            ),
            feedback: Material(
              color: Colors.transparent,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue.withOpacity(0.5), // Slightly transparent feedback
                child: const Center(
                  child: Text('Dragging', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            childWhenDragging: Container(
              width: 100,
              height: 100,
              color: Colors.blue.withOpacity(0.2), // Faded container when dragging
            ),
          ),

          const SizedBox(height: 50),

          // DragTarget area
          DragTarget<String>(
            onWillAccept: (data) => true, // Accept any data
            onAccept: (data) {
              // Action when the item is dropped on the target
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$data dropped!')),
              );
            },
            builder: (context, candidateData, rejectedData) {
              return Container(
                width: 200,
                height: 200,
                color: candidateData.isEmpty ? Colors.green : Colors.blue,
                child: const Center(
                  child: Text('Drop here', style: TextStyle(color: Colors.white)),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
