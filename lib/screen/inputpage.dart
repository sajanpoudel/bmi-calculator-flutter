import '../components/buttonButton.dart';
import 'package:flutter/material.dart';
import '../components/reUsableColumn1.dart';
import '../components/reUsableCard1.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/constant.dart';
import 'result_page.dart';
import 'package:bmi_calculator/bmibrain.dart';

int height = 150;
int weight = 40;
int age = 10;

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender userGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReUsableCard(
                  onTapGesture: () {
                    setState(() {
                      userGender = Gender.male;
                    });
                  },
                  color: userGender == Gender.male
                      ? kReUsableCardColor
                      : kInactiveCardCOlor,
                  cardChild: ReUsableColumn(
                    text: Text(
                      "Male",
                      style: kLabelTextStyle,
                    ),
                    icon: Icon(
                      FontAwesomeIcons.mars,
                      size: 80.0,
                    ),
                  ),
                )),
                Expanded(
                    child: ReUsableCard(
                  onTapGesture: () {
                    setState(() {
                      userGender = Gender.female;
                    });
                  },
                  color: userGender == Gender.female
                      ? kReUsableCardColor
                      : kInactiveCardCOlor,
                  cardChild: ReUsableColumn(
                    text: Text(
                      "Female",
                      style: kLabelTextStyle,
                    ),
                    icon: Icon(
                      FontAwesomeIcons.venus,
                      size: 80.0,
                    ),
                  ),
                )),
              ],
            ),
          ),
          Expanded(
              child: ReUsableCard(
            color: kReUsableCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kLabelBold,
                    ),
                    Text('cm', style: kLabelTextStyle),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15.0, elevation: 2.5),
                      overlayColor: Color(0x269EB1555),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 25.0)),
                  child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      }),
                )
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReUsableCard(
                  color: kReUsableCardColor,
                  cardChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT', style: kLabelTextStyle),
                        Text(
                          weight.toString(),
                          style: kLabelBold,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  size: 30.0,
                                ),
                                padding: EdgeInsets.all(12),
                                shape: CircleBorder(),
                              ),
                            ),
                            Expanded(
                              child: MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                child: Icon(
                                  Icons.minimize,
                                  size: 30.0,
                                ),
                                padding: EdgeInsets.all(12),
                                shape: CircleBorder(),
                              ),
                            )
                          ],
                        )
                      ]),
                )),
                Expanded(
                    child: ReUsableCard(
                  color: kReUsableCardColor,
                  cardChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE', style: kLabelTextStyle),
                        Text(
                          age.toString(),
                          style: kLabelBold,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  size: 30.0,
                                ),
                                padding: EdgeInsets.all(12),
                                shape: CircleBorder(),
                              ),
                            ),
                            Expanded(
                              child: MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                child: Icon(
                                  Icons.minimize,
                                  size: 30.0,
                                ),
                                padding: EdgeInsets.all(12),
                                shape: CircleBorder(),
                              ),
                            )
                          ],
                        )
                      ]),
                )),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              BMICalculator bmiBrain =
                  BMICalculator(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmi: bmiBrain.bmiCalculate(),
                    result: bmiBrain.bmiResult(),
                    suggestion: bmiBrain.bmiSuggestion(),
                  ),
                ),
              );
            },
            buttonTitle: 'Calculate',
          )
        ]),
      )),
    );
  }
}
