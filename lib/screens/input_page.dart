import 'dart:ui';

import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/reusablecard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import '../components/iconcontent.dart';
import '../components/reusablecard.dart';
import '../components/bottom_button.dart';

// Routes
import 'result_page.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;

  int height = 180;
  double weight = 60;
  int age = 20;

  /*void changeColour(Gender key) {
    //key == 1 male, 2 female
    if(key==Gender.male) {
      // print(maleCardColour.toString() + "  "  + inactiveCardColor.toString() + "  "+ activeCardColor.toString());
      if (maleCardColour == activeCardColor) {
        maleCardColour = inactiveCardColor;
        femaleCardColour = activeCardColor;
      } else {
        maleCardColour = inactiveCardColor;
      }

     // (maleCardColour == activeCardColor) ? (maleCardColour = inactiveCardColor) : (maleCardColour = inactiveCardColor);
    }
    if(key==Gender.female) {
      if(femaleCardColour == activeCardColor) {
        femaleCardColour = inactiveCardColor;
        maleCardColour = activeCardColor;
      } else {
        femaleCardColour = activeCardColor;
      }
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          print("Male card Pressed!");
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                      cardChild: IconContent(icon: FontAwesomeIcons.mars, text: 'MALE'),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          print("Female card Pressed!");
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
                      cardChild: IconContent(icon: FontAwesomeIcons.venus, text: 'FEMALE'),
                    ),
                  ),
                ],
              ),
          ),
          Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kInactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('HEIGHT', style: kLabelTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(height.toString(), style: kNumTextStyle,),
                              SizedBox(width: 5.0,),
                              Text('cm', style: kLabelTextStyle,),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: kBottomConstraintColor,
                              inactiveTrackColor: Colors.grey.shade600,
                              trackHeight: 2.0,
                              thumbColor: Colors.pink.shade600,
                              overlayColor: Color(0x29EB1555),     // 16% opacity of overlay
                              thumbShape: RoundSliderThumbShape( enabledThumbRadius: 10.0),
                              overlayShape: RoundSliderOverlayShape( overlayRadius: 30.0),
                            ),
                            child: Slider(
                              value: height.toDouble(),
                              min: minHt,
                              max: maxHt,
                              onChanged: (double newHeight) {
                                setState(() {
                                  height = newHeight.toInt();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          ),
          Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kInactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WEIGHT', style: kLabelTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(weight.toStringAsFixed(1), style: kNumTextStyle,),
                              SizedBox(width: 5.0,),
                              Text('kg', style: kLabelTextStyle,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              /*FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                backgroundColor: kBottomConstraintColor,
                                child: Icon(
                                  Icons.remove,
                                  size: 40.0,
                                  color: Colors.grey.shade400,
                                ),
                              )*/
                              IteratorButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight -= 0.1;
                                  });
                                },
                              ),
                              SizedBox(width: 20.0,),
                              IteratorButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    weight += 0.1;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kInactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE', style: kLabelTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(age.toString(), style: kNumTextStyle,),
                              SizedBox(width: 5.0,),
                              Text('yr', style: kLabelTextStyle,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IteratorButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(width: 20.0,),
                              IteratorButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          ),
          BottomButton(
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            buttonTitle: 'CALCULATE BMI',
          ),
        ],
      ),
    );
  }
}


class IteratorButton extends StatelessWidget {

  const IteratorButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      fillColor: kBottomConstraintColor,
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      child: Icon(icon),
    );
  }
}




//0XFF1D1E33
//0xFF1118328

/*
GestureDetector(
                      onTap: () {
                        print('Female card pressed');
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child:
)
 */