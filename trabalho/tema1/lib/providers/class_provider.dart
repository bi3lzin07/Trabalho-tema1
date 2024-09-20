import 'package:flutter/material.dart';
import '../models/class.dart';

class ClassProvider with ChangeNotifier {
  List<Class> _classes = [];
  int _nextId = 1;

  List<Class> get classes => _classes;

  void addClass(String name) {
    _classes.add(Class(id: _nextId++, name: name));
    notifyListeners();
  }

  void removeClass(int id) {
    _classes.removeWhere((classItem) => classItem.id == id);
    notifyListeners();
  }
}
