import 'package:flutter/material.dart';

class LoginFieldModel extends ChangeNotifier {
  String number = "";

  void setNumber(String number) {
    this.number = number;
    notifyListeners();
  }
}
