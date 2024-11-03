// lib/providers/auth_provider.dart
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final Map<String, String> _users = {}; // Stores users as email-password pairs
  String? _loggedInUser;

  bool get isAuthenticated => _loggedInUser != null;

  String? get loggedInUser => _loggedInUser;

  String? register(String email, String password) {
    if (_users.containsKey(email)) {
      return 'User already exists.';
    }
    _users[email] = password;
    return null;
  }

  String? login(String email, String password) {
    if (_users[email] == password) {
      _loggedInUser = email;
      notifyListeners();
      return null;
    } else {
      return 'Invalid email or password.';
    }
  }

  void logout() {
    _loggedInUser = null;
    notifyListeners();
  }
}
