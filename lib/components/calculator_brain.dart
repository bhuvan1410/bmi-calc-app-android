import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.weight, this.height});

  final int weight;
  final int height;
  double _bmi;

  String calculation() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String results() {
    if (_bmi >= 25) {
      return 'overweight';
    } else if (_bmi > 18.5) {
      return 'normal';
    } else {
      return 'underweight';
    }
  }

  String interpretation() {
    if (_bmi >= 25) {
      return 'Your BMI is too high, please exercise and eat a little bit less';
    } else if (_bmi >= 18.5) {
      return 'Your BMI is good. Great job!! Keep Rocking!';
    } else {
      return 'Your BMI is low, eat some more and gain some weight!';
    }
  }
}
