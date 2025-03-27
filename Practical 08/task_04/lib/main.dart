import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Combined Fade-In and Scale Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CombinedAnimationScreen(),
    );
  }
}

class CombinedAnimationScreen extends StatefulWidget {
  const CombinedAnimationScreen({super.key});

  @override
  _CombinedAnimationScreenState createState() => _CombinedAnimationScreenState();
}

class _CombinedAnimationScreenState extends State<CombinedAnimationScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    final curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut, // Apply easeInOut for both fade and scale
    );

    // Define Tween for fade-in (opacity from 0.0 to 1.0)
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation);

    // Define Tween for scaling (size from 0.0 to 1.0)
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
        title: Text('Combined Fade-In and Scale Animation'),
      ),
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation, // Apply fade-in effect
          child: ScaleTransition(
            scale: _scaleAnimation, // Apply scale effect
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Combined!',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
