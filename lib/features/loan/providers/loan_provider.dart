import 'dart:io';

import 'package:flutter/material.dart';

class LoanProvider with ChangeNotifier {
  int _currentStep = 0;
  int get currentStep => _currentStep;
  File? idCard;
  File? letterOfSalaryDomiciliation;

  void setIdCard(File file) {
    idCard = file;
    notifyListeners();
  }

  void setLetterOfSalaryDomiciliation(File file) {
    letterOfSalaryDomiciliation = file;
    notifyListeners();
  }

  void reset() {
    _currentStep = 0;
    idCard = null;
    letterOfSalaryDomiciliation = null;
    notifyListeners();
  }

  void nextStep({int? totalSteps}) {
    if (totalSteps != null) {
      _currentStep += totalSteps;
    } else {
      _currentStep++;
    }
    notifyListeners();
  }

  void previousStep() {
    _currentStep--;
    notifyListeners();
  }
}
