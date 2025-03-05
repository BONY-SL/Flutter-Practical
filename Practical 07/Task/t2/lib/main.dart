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
        appBar: AppBar(title: Text('Profile Card')),
        body: Center(
          child: Card(
            elevation: 8, // Add elevation for shadow effect
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // Rounded corners
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Image and Name
                  ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOH2aZnIHWjMQj2lQUOWIL2f4Hljgab0ecZQ&s'), // Replace with actual image URL
                    ),
                    title: const Text(
                      'Dilshan Pathirage',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                      'Undergraduate University of Ruhuna',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                  const Divider(), // Divider to separate the details
                  // Additional details in the profile card
                  const ListTile(
                    leading: Icon(Icons.email),
                    title: Text('dilshanpathirage995@gmail.com'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('+94 77 1981 995'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text('Kaluthara, Sri Lanka'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
