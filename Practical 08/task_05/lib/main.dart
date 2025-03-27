import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimationHomePage(),
    );
  }
}

class AnimationHomePage extends StatefulWidget {
  @override
  _AnimationHomePageState createState() => _AnimationHomePageState();
}

class _AnimationHomePageState extends State<AnimationHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 300.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceIn, // Change this to experiment with different curves
      ),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  void _toggleAnimation() {
    setState(() {
      if (_isAnimating) {
        _controller.stop();
      } else {
        _controller.forward();
      }
      _isAnimating = !_isAnimating;
    });
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
        title: Text('Custom Animation Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Container(
                  width: _animation.value,
                  height: _animation.value,
                  color: Colors.blue,
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleAnimation,
              child: Text(_isAnimating ? 'Stop Animation' : 'Start Animation'),
            ),
          ],
        ),
      ),
    );
  }
}