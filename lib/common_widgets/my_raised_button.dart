import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyRaisedButton extends StatelessWidget {
  MyRaisedButton({
    Key key,
    @required this.myWidth,
    @required this.myHight,
    @required this.myFunction,
    @required this.myColor,
    @required this.textString,
  }) : super(key: key);

  final double myWidth;
  final double myHight;
  final Function myFunction;
  final Color myColor;
  final String textString;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: myFunction,
      color: myColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.black)),
      child: Padding(
          padding: EdgeInsets.only(right: myWidth * 3),
          child: Text(
            textString,
            style: TextStyle(fontSize: myHight * 5),
            textAlign: TextAlign.center,
          )),
    );
  }
}
