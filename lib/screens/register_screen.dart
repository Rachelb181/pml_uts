// lib/screens/register_screen.dart
import 'package:flutter/material.dart';
import '../providers/auth_provider.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  // Menghapus const pada konstruktor
  RegisterScreen({Key? key}) : super(key: key);

  // Inisialisasi TextEditingController
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')), // Menggunakan const
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Menggunakan const
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                  labelText: 'Email'), // Menggunakan const
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                  labelText: 'Password'), // Menggunakan const
              obscureText: true,
            ),
            const SizedBox(height: 20), // Menggunakan const
            ElevatedButton(
              onPressed: () {
                // Pastikan tidak mengirim nilai null
                String message = Provider.of<AuthProvider>(context,
                            listen: false)
                        .register(
                            emailController.text, passwordController.text) ??
                    "Registration failed"; // Memberikan nilai default jika null

                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(message)));
              },
              child: const Text('Register'), // Menggunakan const
            ),
          ],
        ),
      ),
    );
  }
}
