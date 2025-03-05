import 'package:flutter/material.dart';

// Main function to run the app
void main() {
  runApp(const MyApp());
}

// Main application widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuickBite',
      theme: ThemeData(primarySwatch: Colors.orange),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/foodDetails': (context) => const FoodDetailsScreen(),
        '/cart': (context) => const CartScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}

// Home Screen showing available food items
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QuickBite')),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Available Food Items', style: TextStyle(fontSize: 24)),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  child: InkWell(
                    onTap: () {
                      // Navigate to the food details screen
                      Navigator.pushNamed(context, '/foodDetails');
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/food${index+1}.jpg', fit: BoxFit.cover, height: 100),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Food Item ${index + 1}',
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Food Details Screen to show details of the selected food item
class FoodDetailsScreen extends StatelessWidget {
  const FoodDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Food Details')),
      body: Column(
        children: [
          Image.asset('assets/food1.jpg', fit: BoxFit.cover, height: 200),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Delicious Burger with Fries',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'A delicious combo of a juicy burger and crispy fries. Perfect for lunch or dinner!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              // Add to cart and navigate to cart screen
              Navigator.pushNamed(context, '/cart');
            },
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}

// Cart Screen showing selected items
class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Your Cart', style: TextStyle(fontSize: 24)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.fastfood),
                  title: Text('Food Item ${index + 1}'),
                  subtitle: const Text('\$10.00'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      // Remove item from cart
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Total: \$30.00', style: const TextStyle(fontSize: 20)),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to profile screen for checkout
              Navigator.pushNamed(context, '/profile');
            },
            child: const Text('Proceed to Checkout'),
          ),
        ],
      ),
    );
  }
}

// Profile Screen showing user details
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('User Profile', style: TextStyle(fontSize: 24)),
          ),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text('Name: Dilshan Pathirage'),
          ),
          const ListTile(
            leading: Icon(Icons.email),
            title: Text('Email: dilshanpathirage995'),
          ),
          const ListTile(
            leading: Icon(Icons.home),
            title: Text('Address: 135/E Badanagodagama Beruwala'),
          ),
          ElevatedButton(
            onPressed: () {
              // Implement checkout logic here
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Order Placed Successfully!')));
            },
            child: const Text('Place Order'),
          ),
        ],
      ),
    );
  }
}
