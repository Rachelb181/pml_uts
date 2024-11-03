// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:myapp/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final List<String> fruits = ['Apple', 'Banana', 'Orange', 'Grapes'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fruit Shop'), // Menggunakan const untuk performa
        actions: [
          IconButton(
            icon: const Icon(Icons.logout), // Menggunakan const untuk performa
            onPressed: () {
              // Memperbaiki penggunaan Provider
              Provider.of<AuthProvider>(context, listen: false).logout();
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: fruits.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(fruits[index]),
          );
        },
      ),
    );
  }
}
