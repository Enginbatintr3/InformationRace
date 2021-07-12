// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_application_5/models/question.dart';

class TestData {
  int _quIn = 0;
  final List<Question> _qubank = [
    Question(qustring: "Titanic gelmiş geçmiş en büyük gemidir", qubool: false),
    Question(
        qustring: "Dünyadaki tavuk sayısı insan sayısından fazladır",
        qubool: true),
    Question(qustring: "Kelebeklerin ömrü bir gündür", qubool: false),
    Question(
        qustring: "Kaju fıstığı aslında bir meyvenin sapıdır", qubool: false),
    Question(
        qustring: "Fatih Sultan Mehmet hiç patates yememiştir", qubool: true),
    Question(qustring: "Fransızlar 80 demek için, 4 - 20 der", qubool: true),
  ];

  String getQuSt() {
    return _qubank[_quIn].qustring;
  }

  bool getQuBool() {
    return _qubank[_quIn].qubool;
  }

  void afterQuestion() {
    _quIn + 1 < _qubank.length ? _quIn++ : "Error";
  }

  bool testfinal() {
    if (_quIn + 1 >= _qubank.length) {
      return true;
    } else {
      return false;
    }
  }

  void reloadTest() {
    _quIn = 0;
  }
}
