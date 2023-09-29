import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  int? height;
  int? weight;
  double? bmi = 01;
  String? calculateBMI() {
    bmi = weight! / pow(height! / 100, 2);
    String displayBMI = bmi!.toStringAsFixed(1);
    return displayBMI;
  }

  String getResult() {
    if (bmi! >= 25) {
      return 'Overweight';
    } else if (bmi! > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getSuggestions() {
    if (bmi! >= 25) {
      return 'You have a higher than normal body weight, Try to exercise more!';
    } else if (bmi! > 18.5) {
      return 'You have a normal body weight, Keep doing the things that you\'re doing!';
    } else {
      return 'You have a lower than normal body weight, Try to eat more!';
    }
  }
}
