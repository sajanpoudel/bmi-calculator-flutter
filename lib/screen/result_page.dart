import 'package:bmi_calculator/components/buttonButton.dart';
import 'package:bmi_calculator/components/reUsableCard1.dart';
import 'package:flutter/material.dart';
import '../components/constant.dart';
class ResultPage extends StatelessWidget {
  ResultPage({@required this.bmi,@required this.result,@required this.suggestion});
  final String bmi;
  final String result;
  final String suggestion;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Result Page')),
      body:Column(
        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:[
          Expanded(child: Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            child: Text("YOUR RESULT",style:kLargeTextStyle)),),
          Expanded(flex:5,
          child: ReUsableCard(color: kReUsableCardColor,
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              Text(result.toUpperCase(),style:kResultTextStyle),
              Text(bmi,style:kBMITextStyle),
              Text(suggestion,textAlign:TextAlign.center,
              style: kBodyTextStyle,
              ),


          ]),)),
          BottomButton(onTap: (){
            Navigator.pop(context);
          },
          buttonTitle: 'ReCalculate',
         )
        ]
      ),
      
    );
  }
}