import 'dart:ui';

import 'package:bmi_calculator/reusablecard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

import 'iconcontent.dart';
import 'reusablecard.dart';

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
  double weight = 60.0;
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
                              Text(weight.toString(), style: kNumTextStyle,),
                              SizedBox(width: 5.0,),
                              Text('kg', style: kLabelTextStyle,),
                            ],
                          ),
                          FloatingActionButton(
                            backgroundColor: kActiveCardColor,
                            child: Icon(
                              Icons.add,
                            ),
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
                              Text('years', style: kLabelTextStyle,),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 15.0),
            width: double.infinity,
            height: kBottomContainerHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: kBottomConstraintColor,
            ),
            child: Text(
              'Calculate BMI',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
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