import 'package:flutter/material.dart';
import '../models/activity_model.dart';

class FitnessProvider with ChangeNotifier {
  String _userName = "Nome do Usuário";
  bool _isDarkMode = false;
  int _weeklyGoal = 2000; // Meta inicial
  final List<Activity> _activities = [];

  // Getters
  String get userName => _userName;
  bool get isDarkMode => _isDarkMode;
  int get weeklyGoal => _weeklyGoal;
  List<Activity> get pendingActivities => _activities.where((a) => !a.isCompleted).toList();
  List<Activity> get completedActivities => _activities.where((a) => a.isCompleted).toList();
  int get calories => completedActivities.length * 20;

  void updateUserName(String newName) {
    _userName = newName;
    notifyListeners();
  }

  void updateGoal(int newGoal) {
    _weeklyGoal = newGoal;
    notifyListeners();
  }

  void addActivity(String title) {
    if (title.trim().isNotEmpty) {
      _activities.add(Activity(id: DateTime.now().toString(), title: title));
      notifyListeners();
    }
  }

  void toggleActivityStatus(String id) {
    final index = _activities.indexWhere((item) => item.id == id);
    _activities[index].isCompleted = !_activities[index].isCompleted;
    notifyListeners();
  }

  void deleteActivity(String id) {
    _activities.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  // FUNÇÃO REDEFINIR TUDO (Funciona agora!)
  void resetProgress() {
    _activities.clear();
    _userName = "Nome do Usuário";
    _weeklyGoal = 2000;
    _isDarkMode = false;
    notifyListeners();
  }
}