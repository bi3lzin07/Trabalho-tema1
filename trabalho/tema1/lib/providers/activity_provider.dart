import 'package:flutter/material.dart';
import '../models/activity.dart';

class ActivityProvider with ChangeNotifier {
  List<Activity> _activities = [];
  int _nextId = 1;

  List<Activity> get activities => _activities;

  void addActivity(String title, String description) {
    _activities.add(Activity(id: _nextId++, title: title, description: description));
    notifyListeners();
  }
}
