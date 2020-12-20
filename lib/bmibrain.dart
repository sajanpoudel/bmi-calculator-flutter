
import 'dart:math';

class BMICalculator{
  
  BMICalculator({this.height,this.weight});
  final int height;
  final int  weight;
  double _bmi;
  String bmiCalculate(){
        _bmi = weight/pow(height/100, 2);
        return _bmi.toStringAsFixed(1);

  }
  String bmiResult(){
    if(_bmi >= 25){
      return 'Overweight';
    }
    else if(_bmi>=18.5){
      return 'Normal';
    }
    else{
      return 'Underweight';
    }
  }
  String bmiSuggestion(){
       if(_bmi >= 25){
      return 'Your weight is higher than normal weight. Give some to exercise.';
    }
    else if(_bmi>=18.5){
      return 'Your body weight is normal. Keep it up.';
    }
    else{
      return 'Your weight is less than normal weight. You can eat a bit more.';
    }
  }
}