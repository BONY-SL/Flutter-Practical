import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Fade-In Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FadeInScreen(),
    );
  }
}

class FadeInScreen extends StatefulWidget {

  const FadeInScreen({super.key});


  @override
  _FadeInScreenState createState() => _FadeInScreenState();
}

class _FadeInScreenState extends State<FadeInScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController with a 3-second duration
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    // Define the Tween for fading in from 0.0 (transparent) to 1.0 (opaque)
    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

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
        title: Text('Fade-In Animation'),
      ),
      body: Center(
        child: FadeTransition(
          opacity: _opacity,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            child: Center(
              child: Text(
                'Hello!',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
