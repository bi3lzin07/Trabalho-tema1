import 'package:flutter/material.dart';
import '../models/user.dart';

class UserProvider with ChangeNotifier {
  User? _user;

  bool get isAuthenticated => _user != null;

  User? get user => _user; // Adicione este getter

  void login(String email, String password) {
    _user = User(email: email, password: password);
    notifyListeners();
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}
