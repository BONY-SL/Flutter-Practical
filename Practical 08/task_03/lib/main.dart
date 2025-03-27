import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Rotation Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RotationAnimationScreen(),
    );
  }
}

class RotationAnimationScreen extends StatefulWidget {
  const RotationAnimationScreen({super.key});

  @override
  _RotationAnimationScreenState createState() => _RotationAnimationScreenState();
}

class _RotationAnimationScreenState extends State<RotationAnimationScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController with an indefinite loop and a 2-second duration for one rotation
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    )..forward(); 

    // Define the Tween for rotating from 0.0 (0 degrees) to 1.0 (360 degrees)
    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear, // Use a linear curve to make the rotation continuous
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rotation Animation'),
      ),
      body: Center(
        child: RotationTransition(
          turns: _rotationAnimation, // Apply the rotation animation
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            child: Center(
              child: Text(
                'Rotate!',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
