import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {

  BottomButton({@required this.onTap, @required this.buttonTitle});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap
      /*() {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage()));
      }*/,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 15.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: kBottomConstraintColor,
        ),
        child: Center(
          child: Text(
            buttonTitle,
            style: kCalcButtonTextStyle,
          ),
        ),
        padding: EdgeInsets.only(bottom: 10.0),
      ),
    );
  }
}
