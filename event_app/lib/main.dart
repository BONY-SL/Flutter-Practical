import 'package:flutter/material.dart';

void main() {

  runApp(EventApp());

}

class EventApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EventScreen(),
    );
  }

}

class EventScreen extends StatefulWidget {

  @override
  _EventScreenState createState() => _EventScreenState();

}

class _EventScreenState extends State<EventScreen> {
  
  String status = "Not Registered";

  void registerForEvent() {
    setState(() {
      status = "Registered!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Event Manager"),
        backgroundColor: Color.fromRGBO(103, 58, 183, 1), // Correct usage of fromRGBO
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.event, size: 80, color: Color.fromRGBO(103, 58, 183, 1)),
            SizedBox(height: 20),
            Text("Event: Tech Conference",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text("Date: 15th June 2025", style: TextStyle(fontSize: 18)),
            Text("Venue: Grand Hall", style: TextStyle(fontSize: 18)),
            SizedBox(height: 30),
            Text("Status: $status",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromRGBO(103, 58, 183, 1))),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(103, 58, 183, 1),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: registerForEvent,
              child: Text("Register", style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
