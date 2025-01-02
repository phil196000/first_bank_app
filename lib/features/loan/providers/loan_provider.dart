import 'package:flutter/material.dart';

class LoanProvider with ChangeNotifier {
  int _currentStep = 0;
  int get currentStep => _currentStep;

  void nextStep() {
    _currentStep++;
    notifyListeners();
  }

  void previousStep() {
    _currentStep--;
    notifyListeners();
  }
}
