import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Scale Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScaleAnimationScreen(),
    );
  }
}

class ScaleAnimationScreen extends StatefulWidget {
  const ScaleAnimationScreen({super.key});

  @override
  _ScaleAnimationScreenState createState() => _ScaleAnimationScreenState();
}

class _ScaleAnimationScreenState extends State<ScaleAnimationScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController with a 2-second duration
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    // Create a Tween that scales the widget from 0.0 to 1.0
    final curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut, // Easing curve: starts slow, speeds up, then slows down
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation);

    // Start the animation
    _controller.forward();
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
        title: Text('Scale Animation'),
      ),
      body: Center(
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            child: Center(
              child: Text(
                'Grow!',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


